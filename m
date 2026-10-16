Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F235675E
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160311; cv=none; b=AeNlrlF0FAWUuFsyqAFWyI74CUZpmUdsWDNENQX+HbWIBbJFzQRMl8YUt1LjGTkkHFmxUa6TFldOuJJCgBpf/1ghvdqZFzBlW64zGlU2nZ8SaHaU8fw/VumsT7zF7iw4j6f5QFA+972JqzqvyYrtfIwL28Iysm/E0GmMKr6/BJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160311; c=relaxed/simple;
	bh=tj4gAgg7sQxoQ6Wi8k0HxAsh+FjXyxAkjxRJtcKvY4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0nb/W62LXYj0mtSflzvBsa0IOzuK489QG03s8RBs4FUBxpX0zvdBO0NSZPwyIrfz04o9UGvleldFXkNHmtAbuUU8hGakUz9q6u41dTsE7WetbRSeZX6kGSAQxnG04b+7FF/VfiUlAuCP16/SFIpLqaQKkaYaFFMnLSjV/GCbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7W0FGKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9rtceGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7W0FGKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9rtceGP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5ai11613245
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/DVcvke3IsQGeYCmDO8400yvshLMopanxRTNZ1+vJBA=; b=N7W0FGKkMl9M0/Rq
	uWKZcnln1V+4tfgg3etjmUvSUiKKB2uLixxTCGVYzyqKzhHbo1PJduM2ENL638IC
	wy9nAel2yt73cLQfQxwsnbEYIfk9tcKcRyRI84ANOk+k/PsRfQABaf9YfhErK8S1
	p7LBft/p/qSFMMzFezYQZiSvKuZal/LzPaeZeWVQlVxsiyEDcmfaw74/SJLz+V1K
	U/mcEUHbkmn0PD8iOBULwa5bIUpvTxX2n1n5VXgS5GX6Ehm+mVtUXUannxJdcMKf
	m3jMoCB4J8Y77zhAOfr2NtCdUWDVgctGhpIzmzAdtIKwBrRHHV6WC8AW3wEe33yY
	dpwRxg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0jrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so314714241.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160308; x=1792765108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DVcvke3IsQGeYCmDO8400yvshLMopanxRTNZ1+vJBA=;
        b=g9rtceGP2AfKWElxrBkELSm5E1aksKjsyuHsaZOOm36xRwgAgG8kPjx01zOjUx+66A
         bI0vaKdEFTnfRuebwyDhWDNH4bak7+AwETMuUVSfVJaR0KcB9aT+DaP0vnlTGQRyCetX
         KL2osACvcRwNYs8kU0927JXiXqP79di5DFW8mHXdsNCXl0FP4plotl3s9TEnEqEeZWjN
         s9w4zJ3A3Pa+URns8dJHEuo7ezl8SoKj9iQ0Ma8ZrCFM452mCnnNYLjfY9BEa5FjqXK5
         37nI7M/hzYewAebjwVoztoTXHwEoj3Qc9jggm57n4bq3Gq11/12LVMOSg12agyWruGi6
         raWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160308; x=1792765108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DVcvke3IsQGeYCmDO8400yvshLMopanxRTNZ1+vJBA=;
        b=QKKpZNBFx28Ulhk6RPPAXtdvtdbEF764aMrrUhHfw4sRO0FqQ1qv5es86VYsfhZ9zJ
         lF39V2CGVGLmXonQsZTiO+VawXcc9hpynUfrkHeUOTPm1dpb+Ijd5hEIk1CqqrlMXJQx
         ozAhm64QvqA8BxfjEB+pEnYfNGCJamx4DUYhYwHzvxXUuv3R/bo4TCZpD8qHpNOiAUnR
         KpPfS03iUsrAU/AWvD9/kBXt3g1Frub6HfHzFFy/Ddcyay7a9F5LrzWBj8rbItobHjUo
         m02vIKsQ4BYWVUlebpYfH34Oykq/ElTE5FIfNTXB7iobjrKBVjdjjULSvbcgZdFjvAhh
         IURA==
X-Gm-Message-State: AFq9FYJrz80f9Z9XIQu9GmgACt7cIxqCYHBInZ3MhbWRsQd4YBQKObU6
	D6tYNNm5Y9/jsV1nWJADjSW8YeZFxd/h9hOhSD+CdHdU9AnVOjKbX+YWfa+rZTUldyjAeBVVwXd
	hOtZKR25FyNnKoheRm024NftRpuSrFE++BvXfIMK6QBLtwxMaxzIQqCM2Trk+QkqR
X-Gm-Gg: AYBFou3xVAJOIUL9+PCzq8n45Nu0z3Ot0DCy1v0Zqpa81y1c/hGDTeNpUGH5x+R+mcP
	riPrGiwxpdI1bG1MHDjafKIZ1UnSehGHFvUqQCUV0qV1Ns6huPNY6yAKavfJMckZF/UCFj/mZcN
	wh7AbJ9i56YEZt+LjPs58TuFyrKs/ITiplqDclEq1M/3V4snppI9lzxVumpelJ5AazHu5BzxikS
	BvLqq6VrcXS23JMrgWkTXeYSGSikkHMgdX988rNw6DMGWCNj+FexvEpZMptQdpoXbkcO8uz84Qc
	aSnIkOFSb6kTMUwtj1yVCGjD5YGUIIuUwdZAwYxe7f39MolKSI1dX2fBIOV2pX2TYjH36xtDD5S
	/5uUVSTYi3c+lJ/5UV7tQLjA1ueM1
X-Received: by 2002:a05:6102:6b09:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7cb3668a2b5mr7590938137.1.1792160307981;
        Fri, 16 Oct 2026 07:18:27 -0700 (PDT)
X-Received: by 2002:a05:6102:6b09:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7cb3668a2b5mr7590933137.1.1792160307533;
        Fri, 16 Oct 2026 07:18:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm58835365e9.13.2026.10.16.07.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:18:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:18:08 +0200
Subject: [PATCH RFC libgpiod 1/3] tools: factor out line value parsing into
 tools-common
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-gpioctl-v1-1-8770622679b8@oss.qualcomm.com>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
In-Reply-To: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6442;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj4gAgg7sQxoQ6Wi8k0HxAsh+FjXyxAkjxRJtcKvY4U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jIub/u0ZPmDbnrVEJMtBndHKZ1b8rooMEyrF
 pgLTKQr+B6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIyLgAKCRAFnS7L/zaE
 wxRmEACvm7HgxFW9BnEaOKO44TyBrPzvjby15er1+EZTh9pHDrgwHCsDwYqa7S9Y2XCvnJcbxF1
 0ow7blNiVLPNdwF+omRWoIaUciYIq57oleNyYMQDLg7UQ8DpZfNy5XiGbQsVk4jUTqIBuMvGzwh
 z3xxx92B7vi14aRvOiw0+IodpDTA8kHf/eJz00d87+5rZ4ziUtda+OIMPJn4mhePls1sRlREhnv
 lARvW/G7TSvS0DONrZjq4+zr+3PQ/5T+KxUj/WLzfyAEMpwME4R3uReDdH989N0q2qogkwPSZ2E
 ubg2uddgaE96m2AVIJ+c32RMLAPZYdh67tD7jsKH+tQk7S8YXHDMymIhG5gcr2aufmZEif9kxxn
 bx/q3nM+XhvUQX2gCmsfInzhTgoSmtTf85y2h1AdNquAbOKPobjCJ4Z2zF8kGA8u7wtiva/b/Q8
 60jJWCIa99XwIcvCddrqepGMHMKCC6tiz80eJAEBX2paL6+yjHV11bNUKlkSqCMxx5TmupiDYF9
 H7T0K6PBtMv2f/Mwz/UHQATHtqNxZ9kBic1afy1eL2wlJ+vfBNA+ChIS3VziJfTaz4HutYbJQIs
 AeRDxw45tgrDRxJb2OIGGRx+mufAOzNf/oRVE48isQatNYOlSiacMVMZy+EubNtOFuGn3Z41QmP
 ZeKSNv0Pk5fxcCg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: NVfmGCBbMmhCfm-1KVtvVFWp-0gVBvZL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9geqnFsq6hPm
 wFpJSpVFi7IncIE2hHIumpVvI5Vkx3D30Wlcc6XqF8TlK5tIL6jPRmi3Hq0edy4DOfsHDgH+EeO
 /of3qTLc6UspXHg/yUGoezo36m4dQUc=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad23235 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=syiDtTD6kpp4CAfPnr4A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX51QLBKwv066U
 eOPrK/yeCf8QxzQUF47Ow4C7e3fqwDzgloB9958YfPgLp3J11isRBrgqrUxmwiF7V3Yyo+wiuYY
 0SxDVQ2uaZvcAepxgDLIn7ADa7dFXvgx0LyKoB5cD/MW6l/F0CI4byjfdcVtZxuqxpDZdYYbzOL
 KsTBrbxF68AUo5SH1SIeBUjWX7y8vRqChCgA4mEc0inavAMN/k9SWvWNJWaHbgOqso7ZesOaz7I
 Vn2DlFfxATUdz91y6HR4+lEe358bOJ6JXa9hrEKTzi3l7m5GzN7Qjf1M2vv/qyDgNr4rvFMcUG8
 +tl2AYJ4pG4Tz/u4rZKOBWmTXOUrpwLAItXEHgZlOkR53R4CQ1MjvAizmLH0I+Ui9MVtSz9iaWT
 WSplap7sYHPcXKblpp127MppoAF5nfAuFYemMRHQ8zPebg1ErxESKUHvjB+xRH3zHEBoeW1CMSG
 8k2858pmonSYVi/PL0A==
X-Proofpoint-ORIG-GUID: NVfmGCBbMmhCfm-1KVtvVFWp-0gVBvZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Move functions for parsing of line value arguments to tools-common so
that both gpioset and the upcoming gpioctl can share them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpioset.c      | 91 +---------------------------------------------------
 tools/tools-common.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 tools/tools-common.h |  5 +++
 3 files changed, 84 insertions(+), 90 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index fce4a7de222f93121c99843a761c5308e021343a..95e99fe6543312ccbece1ec3b0b37ae5d4878790 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -227,95 +227,6 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	return optind;
 }
 
-static enum gpiod_line_value parse_value(const char *option)
-{
-	if (strcmp(option, "0") == 0)
-		return GPIOD_LINE_VALUE_INACTIVE;
-	if (strcmp(option, "1") == 0)
-		return GPIOD_LINE_VALUE_ACTIVE;
-	if (strcmp(option, "inactive") == 0)
-		return GPIOD_LINE_VALUE_INACTIVE;
-	if (strcmp(option, "active") == 0)
-		return GPIOD_LINE_VALUE_ACTIVE;
-	if (strcmp(option, "off") == 0)
-		return GPIOD_LINE_VALUE_INACTIVE;
-	if (strcmp(option, "on") == 0)
-		return GPIOD_LINE_VALUE_ACTIVE;
-	if (strcmp(option, "false") == 0)
-		return GPIOD_LINE_VALUE_INACTIVE;
-	if (strcmp(option, "true") == 0)
-		return GPIOD_LINE_VALUE_ACTIVE;
-
-	return GPIOD_LINE_VALUE_ERROR;
-}
-
-/*
- * Parse line id and values from lvs into lines and values.
- *
- * Accepted forms:
- *     'line=value'
- *     '"line"=value'
- *
- * If line id is quoted then it is returned unquoted.
- */
-static bool parse_line_values(int num_lines, char **lvs, char **lines,
-			      enum gpiod_line_value *values, bool interactive)
-{
-	char *value, *line;
-	int i;
-
-	for (i = 0; i < num_lines; i++) {
-		line = lvs[i];
-
-		if (*line != '"') {
-			value = strchr(line, '=');
-		} else {
-			line++;
-			value = strstr(line, "\"=");
-			if (value) {
-				*value = '\0';
-				value++;
-			}
-		}
-
-		if (!value) {
-			if (interactive)
-				printf("invalid line value: '%s'\n", lvs[i]);
-			else
-				print_error("invalid line value: '%s'", lvs[i]);
-
-			return false;
-		}
-
-		*value = '\0';
-		value++;
-		values[i] = parse_value(value);
-
-		if (values[i] == GPIOD_LINE_VALUE_ERROR) {
-			if (interactive)
-				printf("invalid line value: '%s'\n", value);
-			else
-				print_error("invalid line value: '%s'", value);
-
-			return false;
-		}
-
-		lines[i] = line;
-	}
-
-	return true;
-}
-
-/*
- * Parse line id and values from lvs into lines and values, or die trying.
- */
-static void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
-				     enum gpiod_line_value *values)
-{
-	if (!parse_line_values(num_lines, lvs, lines, values, false))
-		exit(EXIT_FAILURE);
-}
-
 static void print_banner(int num_lines, char **lines)
 {
 	int i;
@@ -794,7 +705,7 @@ static void interact(struct gpiod_line_request **requests,
 			if (num_lines == 0)
 				printf("at least one GPIO line value must be specified\n");
 			else if (parse_line_values(num_lines, &words[1], lines,
-						   values, true) &&
+						   values) &&
 				 valid_lines(resolver, num_lines, lines)) {
 				set_line_values_subset(resolver, num_lines,
 						       lines, values);
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 4482ea5d6a4c6ef3cad3af2fb960d230e1a542a0..6ac9517821f81ee8592493ed37237ef795c8f1a6 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -115,6 +115,84 @@ int parse_bias_or_die(const char *option)
 	return GPIOD_LINE_BIAS_DISABLED;
 }
 
+static int parse_line_value(const char *option)
+{
+	if (strcmp(option, "0") == 0 || strcmp(option, "inactive") == 0 ||
+	    strcmp(option, "off") == 0 || strcmp(option, "false") == 0)
+		return GPIOD_LINE_VALUE_INACTIVE;
+	if (strcmp(option, "1") == 0 || strcmp(option, "active") == 0 ||
+	    strcmp(option, "on") == 0 || strcmp(option, "true") == 0)
+		return GPIOD_LINE_VALUE_ACTIVE;
+
+	return GPIOD_LINE_VALUE_ERROR;
+}
+
+int parse_line_value_or_die(const char *option)
+{
+	int val = parse_line_value(option);
+
+	if (val == GPIOD_LINE_VALUE_ERROR)
+		die("invalid line value: '%s'", option);
+
+	return val;
+}
+
+/*
+ * Parse line id and value pairs from lvs into lines and values.
+ *
+ * Accepted forms:
+ *     'line=value'
+ *     '"line"=value'
+ *
+ * If line id is quoted it is returned unquoted.
+ */
+bool parse_line_values(int num_lines, char **lvs, char **lines,
+		       enum gpiod_line_value *values)
+{
+	char *value, *line;
+	int i;
+
+	for (i = 0; i < num_lines; i++) {
+		line = lvs[i];
+
+		if (*line != '"') {
+			value = strchr(line, '=');
+		} else {
+			line++;
+			value = strstr(line, "\"=");
+			if (value) {
+				*value = '\0';
+				value++;
+			}
+		}
+
+		if (!value) {
+			print_error("invalid line value: '%s'", lvs[i]);
+			return false;
+		}
+
+		*value = '\0';
+		value++;
+		values[i] = parse_line_value(value);
+
+		if (values[i] == GPIOD_LINE_VALUE_ERROR) {
+			print_error("invalid line value: '%s'", value);
+			return false;
+		}
+
+		lines[i] = line;
+	}
+
+	return true;
+}
+
+void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
+			      enum gpiod_line_value *values)
+{
+	if (!parse_line_values(num_lines, lvs, lines, values))
+		exit(EXIT_FAILURE);
+}
+
 long long parse_period(const char *option)
 {
 	unsigned long long p, m = 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 85ee765255bbba991cd2e1fbe6b727a9e998d47e..5083b0908584f98a00321ca3fadf46f55c0a3066 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -35,6 +35,11 @@ void die_oom(void) NORETURN;
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
 int parse_bias_or_die(const char *option);
+int parse_line_value_or_die(const char *option);
+bool parse_line_values(int num_lines, char **lvs, char **lines,
+		       enum gpiod_line_value *values);
+void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
+			      enum gpiod_line_value *values);
 long long parse_period(const char *option);
 unsigned long long parse_period_or_die(const char *option);
 void sleep_us(unsigned long long period);

-- 
2.47.3

