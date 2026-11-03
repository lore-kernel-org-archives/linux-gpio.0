Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715432;
	b=LJ7l1GUNo9iB+9CxliVgscU0OkaDu2NomX0QtLso21diUFlArXFD3XpFPhkBiFXJuGUp
	 rNhDpj0tIe/w0NGzKXuRwiqdeuyKLO48Hv7JrK1QWdHCRYKQOMFp6dCfxH9BkSyGbdOhw
	 ezLOepbdSNNTOLTJSQ754B0mTpjfVXgbmYCx8gWqqM1S+eyEhmDtesg2zH9/I4TRpgtHC
	 Ew2Wu10Nz+DTqOqzq+DjC1Rx0wpx0JDTkL98rdSAPEjaR30jDt69OPbvxG5Yu6LQ2c6ab
	 q21/Expb/K3Kkh+8vlKxzyUDoG6hkauQl9jEMhZUpHA9YI3lqtwHKX/4LXLNZ39jDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0ejvKYo5mHVdukk7d16/gJ66BFZmTx+9guN9NezON18=;
	b=n2UGUP6WTjR6/I/8oap0FsmK0G4Wk8EdT/CWIVlQlpTHf7uaRnZjrZ7bExRvA9NdyEdJ
	 t8oXlGgVkwIaYMJZc1Th4yWoM7hKqqKdWG5cdON95rhMBGn5BJUodJwRCUpUU3My6n9Yh
	 /NPLXMmKTQN31BECgvadpL8Ewd4b1Rk3FHs7JDzbS0FE/T4rqpQOiElOsb+wiM6hhYZha
	 YOxNodCyLxxiPWdFThvUaSlI0EuRiGAYFmgNtppcLtz7lTAytDOB/6fIMvlKziYT/Sg1n
	 SErgk4VUMAL3hUTGLnzmqPuRQTEJgFGH5GgheAdh+D8MAAnL2FfEFBN7M7GkxMLUSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jv0ODkj6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M+BaWvBx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58877606A32C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58877606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jv0ODkj6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M+BaWvBx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EALkG3049176
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 14:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ejvKYo5mHVdukk7d16/gJ66BFZmTx+9guN9NezON18=; b=Jv0ODkj6hTIulUaK
	JDxHlLmorPJv89tb2wkjaI/xQlfgflGLjqUej+uVnWJ7vaS4Kgn5LQwvBBA5tR2b
	WFWGZ5OXLK9eYimnNLPW8r7IvNZNb+043BrgTF1+LK8R2GM0osgoBK3WPwrGLMtu
	IHQQZEQBrED3dBu0lwP+cCAShBSEJUE21LXVxeyaCAPyCvnMmCdfZBC8DsIYtBCl
	Y3anudn9JB0JsFJhH0WIY/19mdTtEmMnTf9BPDaungjE+mWG3ixelHY7W+f6Gt2+
	6v6zMpLjDw/svz+iaKhfiVE4fSNP0UNFAIylhky7Il0hytqapuDMsOJXCeqwsrK3
	OffP2g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5k2en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 14:17:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so731965137.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 06:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715431; x=1794320231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ejvKYo5mHVdukk7d16/gJ66BFZmTx+9guN9NezON18=;
        b=M+BaWvBxR4S90x1KTNbadYogCz6MenOr41TctihANR/LMxd5IwR0CQtEbkukxnPsiO
         kPPl7wUuJb0baLCZVhwTKI28Wwbpf34Zrd7u0lpjlQAowu1Cgkoey1+KHqoeG9uWBAma
         RLNNl4FPj5fe07VRqRr+/LgCg3bvb4IE4bjtPtkN5DcJUp39Xg1BNs3kNEz60babXeUX
         pKCqTv8M7ovhWZOfXf6dS3bRhOVRCZ2gePquYmVVxzA875DZrVOWLJPq5JR7KMau5hYo
         ZX3T+xYhiLUJSBFx/QjnP9iFRmFF3KbPiuAeFPc2GdJ8q8p0tpjkdXVk2dcQslbjDYPo
         abeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715431; x=1794320231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ejvKYo5mHVdukk7d16/gJ66BFZmTx+9guN9NezON18=;
        b=oIKo9ZWBY8jmiZQ8HgTZ/aqHwcjWN1jyY7fxzcxwSqmrcCz0X+e6vYoUxB9TYUqHmc
         7YmrxGwl1mwDpKpULGE+hACvfdGI4VL37uwMpDTE2ZcYLORYANTWB1XjG/OhqYMuZQGr
         OcKZMatxGS3aYl5rxuPce6xCKERvdwJo6KanxxHn7TMR/Q3YmyUIo7bYDE2PMNWV4qJh
         QS2xAfsMH1we59gdOjru30fYr/Tv+MnIIJQMteGZgmuVvOtQ1e3sS5ADptbEc33U63Zo
         dgf43SmCcXam/29sWFLI3lUK+ICFlI55iqxsHkZ5d7vWpoZHapRujJJkST0cS3kiGkco
         Zj3g==
X-Gm-Message-State: APuU4Z8naM0/t4zEz1ypJs6M+RBmWiME+XlA7lPNlOe70zboWnpWODTL
	WYhlJ/YZdE2VqDHDzZOr70lNQ4hVkhHuglP3rbLeCbe6GQqOpqLtTlemSltJDbktGm0mo93crJr
	2ZhqqQWIeFtR5NdeQW/z+4RBvrU9H/HlLDPYks5nIUNfTUBKIvcpWhw0k0m44xhjo
X-Gm-Gg: AYBFou39/CDvTUMqwjhzZfStLVQhRGW1hKGc7gdwQpFMkFgCMsrC9yiRAqzL0dMgRi/
	QpE8CPx56ISWfwJQgznnakcYnH/3x2fexDDsbMF+9eh/4NAkEKUAJCsiShcLNu4aALJVI4beHGT
	3q65XMYg5Nn7+tn8QHveBSFtrcC7Xbii/q+d9SrwNkEhY6T8xj8wmvbA+DftQRw0r/H3r7E+FwL
	JxOARNKUvqtHywEODGRqYQQe13/Oetmi9G3z2W2wnpI5vMlB5IhyKjrcwu21ImgP6RUsXBPb6z0
	fIKvTdNRs3n+uO1sOzY6Eyr+zNLQyWd1ICeW/qeP0JLd1a1P+m+Fw4yZ1y3fVLCdqDa+kbeXTaq
	Rq+m+Tffk8u5L4ptcvTebdbFxp+kl2Nt1/pTiKcbY5WzetosBiJLXH580fXKaNEoB6Z8uZsMLOM
	RyvQ==
X-Received: by 2002:a05:6102:4186:b0:7d0:66eb:26b1 with SMTP id ada2fe7eead31-7d07265f196mr4521205137.21.1793715430313;
        Tue, 03 Nov 2026 06:17:10 -0800 (PST)
X-Received: by 2002:a05:6102:4186:b0:7d0:66eb:26b1 with SMTP id ada2fe7eead31-7d07265f196mr4521197137.21.1793715429767;
        Tue, 03 Nov 2026 06:17:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27034897f8f.26.2026.11.03.06.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:17:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:17:01 +0100
Subject: [PATCH libgpiod v2 1/4] tools: factor out line value parsing into
 tools-common
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpioctl-v2-1-1660aa3dbe5b@oss.qualcomm.com>
References: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
In-Reply-To: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6816;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TGw3s43lJlJxF9Tgo0ilUF/R4O065FmKnAM9GVsFdWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ezi/4HR87UTFGLCkYB3v6YjyyYr3GDu0IU4P
 Tf33FDr4LqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauns4gAKCRAFnS7L/zaE
 w+J0EAC7Hc99B01utzouamR+IrOia1IEI8O+QpQ4+8XD80sW8+ZrN9CjnGjl5FSROlKHEF+7lRw
 jMOTC2UB+b5l33yADEYsfS302tvA/9gXjm27s3O9/BXTKryuBejlWtHPRt4RuofMLyL9yeVHTgC
 LI1aoywb5OBPbwRbRxJUG/lrbhANXF8k7q4TJRXvymk/aSji3oRDm859kBIBlrIboUWF+idggVn
 VTmCff6DV6mvaiEBTXMXujonKlh9iYGgaYN3v8n9+R9oVrkXStgyDrwg6kTs/aV3k80ifOhWfql
 7ZgqRPUKTxOlTTC+R6Cdn2YCWlPwhmMZ9jwtYwwSIPIAMuIxAe9oLeLc8UdGaWA81z1aDakgu5n
 gF3BPka+LGN9ozgse54KHy3c7wq11dD0sjFc5M8uWbqcKWeJ8USZmsTQthByaLf34fja2zLMfFF
 uKuVjoNIpegY84AEh+7naJytJ0JEhWN89XOUibzFhUgFXTwJQM0yzC1OZeTHqixilIsUGNbb6C0
 CvZuVBuh6qWlAcHGligMIe/VyI6JnBbxD1VvkItzZ+Iqn6gKYoDwPbXpEDHIFxXPGck3vA6cxtm
 5XbBh/4RsKPU6HtqWpRlv/IimrDYZbzvL8u4QPTKqoTubPBi9hZeITELW4vDUtpmYq+slNJz88I
 zPFq0/MgEayBEng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: QRBtvsp2uDJZMCd0dShYRfSLXPFZoSaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX4t8ggCJyY9iC
 aTl+/z1Po3u+8ufQBiiv2t1ab0Myksz7y8HOJen+dcblwtd3P36Y1eFhLVAp5epmSCvgSBwEtdv
 VAcNqCDdcFxsB9VlRf9nAhqto2IEhv+9BYfY/Sd2Z5dIKjH9gk1c34V7HajWkBPXn2PSdKpw6DQ
 lnFEs/CiW+XuNaE0AUq6JecbP27jr8QPx/guMd+zXVLHUkPU53gm2SRO/NC6onh1T1IPJmvyl3V
 PvhQX3kAWJdETnyUrxqGUCk1L+SBSs3Rjuc5KWeAQInqIQs3Sh/lEHNUxcohblrG+Ea7nXAO/Xa
 s6Vkr0i2fyrb32TF1ftmuW7r8ipe6bTCA8QyxCwk+GWOaV/GFj8ZerdOcinGJzMwHU34U3H7tyy
 vuBlid27/NksSLiXLu13l/iwco/ZpKYC187rp65kFUN6lnxpNzwvcqfH3tFzDLgXfie0K5s+iYZ
 pb720QYUl1MhBmWJi8Q==
X-Proofpoint-GUID: QRBtvsp2uDJZMCd0dShYRfSLXPFZoSaJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX8U8OpScr/dkw
 IxKy/vYpo+0NkQvR9JY4XQs3SoF5oZNJ2ssbPzfvin9zrlLcf0lUTZP14SmYwX0xxHVVqK/+EEG
 d8dsipExoukJkDJbG28tQZuvAwIXCeM=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9ece7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZhFfK3qdfChj_4INEGoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

Move functions for parsing of line value arguments to tools-common so
that both gpioset and the upcoming gpioctl can share them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpioset.c      | 89 -----------------------------------------------
 tools/tools-common.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 tools/tools-common.h |  5 +++
 3 files changed, 103 insertions(+), 89 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index fce4a7de222f93121c99843a761c5308e021343a..87055b2e3ba36f1b5f788c21671514aab9f50152 100644
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
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 4482ea5d6a4c6ef3cad3af2fb960d230e1a542a0..4a61ec672576a19a67b909603c83019fc2b9885e 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -115,6 +115,104 @@ int parse_bias_or_die(const char *option)
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
+ * If line id is quoted it is returned unquoted. A quoted id may contain '=' and
+ * '"=' as the value is always the part after the last '"='.
+ *
+ * The strings in lvs are modified in place: the separator is replaced with a
+ * NUL byte and lines point into them.
+ *
+ * Errors are reported on stdout without the program name prefix in
+ * interactive mode and on stderr otherwise.
+ */
+bool parse_line_values(int num_lines, char **lvs, char **lines,
+		       enum gpiod_line_value *values, bool interactive)
+{
+	char *value, *line;
+	bool quoted;
+	int i;
+
+	for (i = 0; i < num_lines; i++) {
+		line = lvs[i];
+		quoted = *line == '"';
+
+		if (!quoted) {
+			value = strchr(line, '=');
+		} else {
+			line++;
+			value = strrchr(line, '=');
+			if (value && value > line && *(value - 1) == '"')
+				value--;
+			else
+				value = NULL;
+		}
+
+		/* No separator or no line id in front of it. */
+		if (!value || value == line) {
+			if (interactive)
+				printf("invalid line value: '%s'\n", lvs[i]);
+			else
+				print_error("invalid line value: '%s'", lvs[i]);
+			return false;
+		}
+
+		*value = '\0';
+		value++;
+
+		/* Skip the '=' after the closing quote. */
+		if (quoted)
+			value++;
+		values[i] = parse_line_value(value);
+
+		if (values[i] == GPIOD_LINE_VALUE_ERROR) {
+			if (interactive)
+				printf("invalid line value: '%s'\n", value);
+			else
+				print_error("invalid line value: '%s'", value);
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
+	if (!parse_line_values(num_lines, lvs, lines, values, false))
+		exit(EXIT_FAILURE);
+}
+
 long long parse_period(const char *option)
 {
 	unsigned long long p, m = 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 85ee765255bbba991cd2e1fbe6b727a9e998d47e..cd07530b8842be005a5875d347040f88e86a9bf1 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -35,6 +35,11 @@ void die_oom(void) NORETURN;
 void die_perror(const char *fmt, ...) NORETURN PRINTF(1, 2);
 void print_version(void);
 int parse_bias_or_die(const char *option);
+int parse_line_value_or_die(const char *option);
+bool parse_line_values(int num_lines, char **lvs, char **lines,
+		       enum gpiod_line_value *values, bool interactive);
+void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
+			      enum gpiod_line_value *values);
 long long parse_period(const char *option);
 unsigned long long parse_period_or_die(const char *option);
 void sleep_us(unsigned long long period);

-- 
2.47.3

