package com.javaclimb.Qomolangma.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
@RestController
@RequestMapping("/gpt")
public class GptController {
    @RequestMapping("/ask")
    public Object gpt(HttpServletRequest request) throws JsonProcessingException {
//        return("珠穆朗玛峰（英语：Mount Qomolangma；藏语：ཇོ་མོ་གླང་མ་；尼泊尔语：सगरमाथा），简称珠峰，岩面高程8844.43米  ，雪面高程8848.86米，是喜马拉雅山脉中的主峰，位于中华人民共和国与尼泊尔边界上，位于东经86.9°，北纬27.9°，是一条近似东西向的弧形山系，它的北坡在中国青藏高原境内，南坡在尼泊尔境内。");
        String text = request.getParameter("textMsg");
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth("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");
        System.out.println(text);
        String requestBody = "{\n" +
                "    \"model\": \"text-davinci-003\",\n" +
                "    \"user\": \""+123+"\",\n" +
                "    \"max_tokens\": 2000,\n" +
                "    \"temperature\": 0.5,\n" +
                "    \"frequency_penalty\": 0,\n" +
                "    \"presence_penalty\": 0,\n" +
                "    \"prompt\": \""+text+"\"\n" +
                "}\n";

        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);
        String url = "https://api.openai.com/v1/completions";
        ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
//            String responseBody = response.getBody();
            // 对返回的响应进行处理
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            String text2 = jsonNode.get("choices").get(0).get("text").asText();
            System.out.println(text2);
            return text2;

        }
        return "0";
    }
}
