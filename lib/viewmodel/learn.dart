import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Learn extends ChangeNotifier {
  Map likes = {
    "100 Level": false,
    "200 Level": false,
    "300 Level": false,
    "400 Level": false,
  };

  void likeCourse(String title) {
    likes[title] = !likes[title];
    notifyListeners();
  }

  Map courses = {
    "100 Level": [
      [
        "MTH 102",
        "Calculus",
        "https://cdn.filesend.jp/private/EP0_m4t9wMmbk12Nr0mIpmcCNgKR7k7bQSbQZJWauL67N2NuZ9FNJsl5KUUbwCIN/MTH%20102.pdf"
      ],
      [
        "MTH 104",
        "Vectors",
        "https://cdn.filesend.jp/private/3dnCkLEL-0SG24ZmlU354-YuM4DchttXp25TswNNAlVeyls5gXV8vqnk0-D1iLST/MTH%20104.pdf"
      ],
      [
        "PHY 104",
        "Electricity and Magnetism",
        "https://cdn.filesend.jp/private/GIL4FRelZ_Bk2fUCC0j73x69_5jmiqWWF_VQz1ugFOTwPeNIVSYE20fZ3RVQk3h7/PHY%20104.pdf"
      ],
    ],
    "200 Level": [
      [
        "CSC 202",
        "File Processing",
        "https://cdn.filesend.jp/private/iBkddn1RrbAazPYFvPcRhDOKv14565iXbPI6E_67Q8anWq4VNrrILaugA84I_ExV/CSC%20202.pdf"
      ],
      [
        "CSC 203",
        "Computer Programming I",
        "https://cdn.filesend.jp/private/6YmUeLsbkWw1dZMvgt72-YuKMB-9Cik13M5GfA03V868J0Ea0S5dZyCdXzTjVWdv/CSC%20203.pdf"
      ],
      [
        "CSC 204",
        "Digital Computer System",
        "https://cdn.filesend.jp/private/vk7PMbSJskwZbNwcWNf88e8bHpzSlXkWNfTkFjBJNm_KLz7Yr9ucLHFkxC3AwvUV/CSC%20204.pdf"
      ],
      [
        "GST 222",
        "Conflict Resolution",
        "https://cdn.filesend.jp/private/jcrNaFQc8Lm84hFJAIH-JslkwVDOsK4imdp0wQ1oNb7i_F_nZxfbG7t7T9VxiiGp/GST%20222.pdf"
      ],
      [
        "MTH 205",
        "Differential Equations I",
        "https://cdn.filesend.jp/private/3vpmh2oJEGn6ho2jO6MWrN6VFk-6_Q4nhGqcs3mY8_0VsR8Bkwr75WCwe1VbOGuL/MTH%20205.pdf"
      ],
      [
        "STA 202",
        "Test of Hypothesis I",
        "https://cdn.filesend.jp/private/we_deBgBwxFM-U1UWwC-cX54ADOjC0Twd4BFXJZY4z6vU3qq605RRWZ1f_SeYXKl/STA%20202.pdf"
      ],
    ],
    "300 Level": [
      [
        "CSC 301",
        "Introduction to Computer",
        "https://cdn.filesend.jp/private/JEOU-IT4TkzkuWWORIu2UdVAoZnNHAzVUv9VA757Jf6c2OrjYJboARAFDCnFdLf-/CSC%20301.pdf"
      ],
      [
        "CSC 303",
        "Computer Architecture",
        "https://cdn.filesend.jp/private/hy5UCaLuXlz1Jz5AV-CylnZm6bhfo4_uOA6hNHHfhcQUEZtJVCD5d6GQEWfRcNPH/CSC%20303.pdf"
      ],
      [
        "CSC 304",
        "Theoretical Computer",
        "https://cdn.filesend.jp/private/3lz1FQWTL597gv310K4xbwUA2SOovPLheu6DRPZMlLGqsku-Lge2qxZ5cNnpw4XC/CSC%20304.pdf"
      ],
      [
        "CSC 305",
        "System Analysis",
        "https://cdn.filesend.jp/private/-ABnNxkjLc7Aw8t79pW7KOWlrbfeNFw0SJtInGsMdjYqJpHTpVMGRKtmFwjItP94/CSC%20305.pdf"
      ],
      [
        "CSC 306",
        "Database Design",
        "https://cdn.filesend.jp/private/YG3rZP7q4Jcep-CKTcrcaxJKEhGOeLR1mMz1bRvUwNMYDtN71tbc36RHYAsHWB7P/CSC%20306.pdf"
      ],
      [
        "CSC 308",
        "Computer Installation",
        "https://cdn.filesend.jp/private/oJnHCnEUi1LePxIeITUbR4eRkKrTV0XRmhc1VlmrXZW9jHgFY4BAGzbZhiO1ga7b/CSC%20308.pdf"
      ],
      [
        "CSC 310",
        "Operations Research",
        "https://cdn.filesend.jp/private/rZx6GwRAz6K-Dhqx6DGXhW1L6ctZbG5fMC8FYu5c68dcc1uwpqqcCbeucPuxQyFy/CSC%20310.pdf"
      ],
      [
        "GST 301",
        "Entrepreneurship Studies",
        "https://cdn.filesend.jp/private/X3r4eHJUDs0EtMe8y0P8JFNwLsKPY2sZmu--u_cVF0WGcgj4jAh9MXF99sBAqpQH/GST%20301.pdf"
      ],
      [
        "MTH 310",
        "Discrete Mathematics",
        "https://cdn.filesend.jp/private/mZyM3Oqf9fvb5Wbq_F4_p9tNuGFt7bXX9bwLciHc0J5fZ0vxUDRDvI6ULyoaatcr/MTH%20310.pdf"
      ],
      [
        "MTH 303",
        "Differential Equations II",
        "https://cdn.filesend.jp/private/ZDAZ9Hj2Z0S0z3B5B6oasUYwa0GaUExpSrEunWwlrOurT_o9YYBysS_RfrnZ2VPO/MTH%20303.pdf"
      ],
    ],
    "400 Level": [
      [
        "CSC 402",
        "Organization of Prog Lang",
        "https://cdn.filesend.jp/private/gmkjjwzhpkC_MpmUdbyA_nkhUE2EhOkRiCeRFi1V-T0zdSmHIK9KmUBFS3frMskK/CSC%20402.pdf"
      ],
      [
        "CSC 403",
        "Software Design",
        "https://cdn.filesend.jp/private/p9pfGMD4S3XREKqVr5uSaGDVl2mx3v7ccRmFT0XiJKiH0jJUK69lntifygh3knmk/CSC%20403.pdf"
      ],
      [
        "CSC 404",
        "Computer Construction",
        "https://cdn.filesend.jp/private/fXtjwXGpztvfzGNCsoWEM8d97ZAHBQ9_Ygq-RRCPUQ-YEWEd-1RXr9JnhzD5sSez/CSC%20404.pdf"
      ],
      [
        "CSC 406",
        "System Modelling",
        "https://cdn.filesend.jp/private/ywedGTgFJVcAOCyTu8TqFJr-GbfntMMKWl1w-yqHvLw-5xch0Cg4RLpJQQhkIpB3/CSC%20406.pdf"
      ],
      [
        "CSC 407",
        "Data Networks",
        "https://cdn.filesend.jp/private/lD00_UcNkK-j25OO4xy5NJSC3uCG2_lq5fYKYYm1As2DmUd9FI4tl5Pj2K6E93-M/CSC%20407.pdf"
      ],
      [
        "CSC 409",
        "Computer Programming II",
        "https://cdn.filesend.jp/private/Ru5Jbd0Ng8eesly9657LtYrzDz663v7GTzHHlLl_VpD46_e3P7SFq8pYWAZuzaSe/CSC%20409.pdf"
      ],
    ],
  };

  Future openFile(String url, String? fileName) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }
}
