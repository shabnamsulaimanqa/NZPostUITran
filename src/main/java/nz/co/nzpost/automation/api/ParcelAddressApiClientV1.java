package nz.co.nzpost.automation.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import nz.co.nzpost.automation.api.responses.GetParcelAddressResponse;
import nz.co.nzpost.automation.api.responses.GetPostshopLocationsResponse;
import nz.co.nzpost.automation.domain.Address;
import nz.co.nzpost.automation.domain.ParcelAddress;
import nz.co.nzpost.automation.domain.PostshopLocation;
import nz.co.nzpost.automation.domain.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

import static java.lang.String.format;

@Component
public class ParcelAddressApiClientV1 {

  private final RestTemplate restTemplate;
  private final ApiProperties apiProperties;
  private final ObjectMapper objectMapper;
  private final String scheme;
  private final String host;

  @Autowired
  public ParcelAddressApiClientV1(RestTemplate restTemplate, ApiProperties apiProperties, ObjectMapper objectMapper) {
    this.restTemplate = restTemplate;
    this.apiProperties = apiProperties;
    this.objectMapper = objectMapper;


    String[] split = apiProperties.getHost().split("://");
    scheme = split[0];
    host = split[1];
  }

  public GetParcelAddressResponse<List<ParcelAddress>> get(Address address) {
    MultiValueMap<String, String> uriVariables = new LinkedMultiValueMap<>();
    uriVariables.add("query", address.getValue());
    uriVariables.add("count", "10");

    final UriComponents uriComponents = UriComponentsBuilder.newInstance()
      .scheme(scheme)
      .host(format("%s%s", host, apiProperties.getParcelAddressUrl()))
      .queryParams(uriVariables)
      .build();

    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
    httpHeaders.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");

    HttpEntity<Object> requestEntity = new HttpEntity<>(httpHeaders);

    ResponseEntity<GetParcelAddressResponse> responseEntity = restTemplate.exchange(uriComponents.toUriString(), HttpMethod.GET, requestEntity, GetParcelAddressResponse.class);
    return responseEntity.getBody();
  }
}
