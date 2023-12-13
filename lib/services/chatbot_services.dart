import 'dart:convert';

import 'package:capstone_wms/screens/main/chatbot/model/openai_model.dart';
import 'package:http/http.dart' as http;

class ChatbotServices {
  static const String baseUrl =
      "http://ec2-18-139-162-85.ap-southeast-1.compute.amazonaws.com:8086";

  Future<http.Response> sendMessage(String token, String message) async {
    final response = await http.post(Uri.parse('$baseUrl/user/chatbot'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'text': message}));

    return response;
  }

  Future<http.Response> getUserId(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    return response;
  }

  Future<GptData> getResponse({required String prompt}) async {
    late GptData modelData = GptData(
        id: '',
        object: '',
        created: 0,
        model: '',
        choices: [],
        usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0));

    try {
      var endpoint = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> header = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer apikey',
        // 'Bearer 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',
      };

      // String promptData =
      //     'I get a salary of $income rupiah each month, right now i have savings about $savings rupiah and i also have debt for about $debt rupiah that need to pay about $monthlyDebtPayment rupiah for every month. Then i also have goal to receive a $goal in the future. Please provide a financial plan for $days days. Please format your answer as json format with ONLY these keys food : Rp....., bills : Rp....., savings : Rp....., transportation : Rp...., entertainment : Rp...., miscellaneous : Rp....., debtpayment: Rp...., advice: "you can achieve ..... for .... year..." without any additional explanations like "here is blabla" and also all the value of each key is string. If the debt is 0 or null please also provide it on your response like Debt Payment: Rp.0.  calculate the advice based on all my input and provide the short simple explanation of the calculation in the advice section DONT add extra keys besides the section i add in this prompt';

      // String promptData =
      //     'I get a salary of $income rupiah each month, right now i have savings about $savings rupiah and i also have debt for about $debt rupiah that need to pay about $monthlyDebtPayment rupiah for every month. Then i also have goal to receive a $goal with price around $goalPrice rupiah in the future. Please provide a financial plan for 30 days. Please format your answer ONLY as follows: food : Rp....., bills : Rp....., savings : Rp....., Savings : Rp....., Transportation : Rp...., Entertainment : Rp...., Miscellaneous : Rp....., Debt Payment: Rp...., Advice: "you can achieve ..... for .... year..." without any additional explanations like "here is blabla". If the debt is 0 or null please also provide it on your response like Debt Payment: Rp.0 . calculate the advice based on all my input and provide the short simple explanation from the result of the calculation in the advice section dont add extra explanation like the details of calculation besides inside the "advice"';
      String promptData = prompt;

      final dataBody = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "kau adalah sebuah aplikasi untuk jual beli gudang bernama DigiHouse"
          },
          {"role": "user", "content": promptData}
        ],
        "temperature": 1,
        "max_tokens": 512,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(endpoint, headers: header, body: dataBody);

      if (response.statusCode == 200) {
        modelData = gptDataFromJson(response.body);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }

    return modelData;
  }
}
