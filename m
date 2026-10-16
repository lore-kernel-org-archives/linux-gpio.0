Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ECD4EA37F
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160313; cv=none; b=hHgHiIRdL387JqYFWLr6QIid/WMIJIH8Gp9ILhsZHPR4TbJhXq8x7DUp07qUweNDjMv51v/ZNhgq9f1uaTW7x8+J+aVAqqD9fTP+f/D6c6DHOD8Vy86Z9jtUJcFTI4Sr0g+QeMBDHyfnX83yOOGMvTRF69yi+rgQ3g8Zs5IJLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160313; c=relaxed/simple;
	bh=JpwgpB4hB1ogFmLYy02K35TTkji7RlVInsKhv6EQy3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoCejzObRXU4YFRR/4pizwifkzHL7sDKAE5pV8OQb6Dm3aVfIU70JGZIGF3hkmIckXmhPMla6wLuwn4L/KjdJN8ZWT6eo6R2cVmWSk52tLkzimx9BIM2gDUpv+NiverScJjVnQt2B+Pni24RuDt75MOnXJcnJjDjteJGo84gYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/d8/OfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhjGjbYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/d8/OfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhjGjbYx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5epi1613342
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClE+02B04ZCUDF2/EaW1APuCIK7ZqhtALfXs2gSrqtc=; b=m/d8/OfK3PRiXZ27
	Q4SBx/7FeF2WnzstiwnfkBGe1ZCAcDHtg/nTy/eUX66nOLr9Y7dgIdNZl+zYQt4g
	HSuqBaxKWBSaVT9jaVtJBveE4F9xw4fsac1/fK4Qe9+/Z0z8ro7PaLbiICImTyQy
	oUYbi1E3C1toWdC+FsIU1sfAqf2gWmQO0K+Fjisa8zJIDNqEFIUVD4qXhvL6Jh/0
	DsZPwZscwnIi/TJlyteGhnAjthQ5XldBEgyZalDyi2Xez2SRFaFhn2vdQKoUJBS+
	fwg/I6QcBFJEuNBpU3DcYbVR5ysbXunnKTLq3HkQvu6DcQedwg0zCFKUcIqEXOXk
	ix9Ikg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0jrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a77961b860so666817137.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160310; x=1792765110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClE+02B04ZCUDF2/EaW1APuCIK7ZqhtALfXs2gSrqtc=;
        b=FhjGjbYxcoAu4klr7Q2rcSSX6KlZqwroTQZTIElGNLZxqlNVudd0+eyAQ6+MKKV1MS
         mmq1AjGh2GA3v3KKm/jucvSk04ImBSgfE0hSvDy8IGfVPsRIYRxQtKvG5eVNewmhhT9j
         v2R0GQPSrhr2gdRF9idNwb8SlZvhnhwmjYOjDm8xqW4JD/jE2mhXWceU2lmxg9Z+2b8n
         tciaN8nlbA1v90r82EB/cgdtNT56XWv721wamu9PoeTHwjwanGZKpAlio/BCYqpGCwMp
         doS6382nYKWkTjsHBeg9dD+xjrmUbWaFTgiQ0tuNEaR2E3DmlCg3K5jEkRbDuhOXZ2F/
         9x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160310; x=1792765110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClE+02B04ZCUDF2/EaW1APuCIK7ZqhtALfXs2gSrqtc=;
        b=2HRly+UiipLtRzmOsWoyJ/R3xJV/5PJxcu1rEuGu46z1GmmpQEWWz7ZKLW8yQQAh+P
         sfrhUvTlmCzD8GNvuUKdk6PKL7SydF12IlG4xnadXYsQZG4DU7VmX0QKBccBADWJpFXs
         LRamg7FCz5snEvKkjVNgXleimDyfF0TKM/nuXQII+IiH8lpHuVFGNH9Lz53fLKyrxg9e
         jAVbDKEYIGx6pZIKCvpac8qAy83hEgjypLp7IZiyewd9v2RLCpHNhFGmBM6n9xOGV7eb
         jLApzYRlb/6lbBeoIkXExZ0cqTa24VvWQzcBKAXuNz3/qMTPxLDrqhktVJbRqZul+OP3
         DZXw==
X-Gm-Message-State: AFq9FYJaJKDR7ju7LPRkZivIiDQKdIt4kUh/g8d3RnW4y3cQ8dbRP7wp
	3Zifdy/BcI5oPjKI+LewyKZRk4BlzwIUg0nWszfkyelkgZC4d/7dv0VYX3QFMrxySUfaF+9zkKo
	Tq/wGzhSAstrNF2dzHxUxs/dEotc05tXh8NZepbTkDvRbkrD55p3Igao63zedhN6BKhQBuQix
X-Gm-Gg: AYBFou17ivY/zxwnR79mVH1uLDlcFNj1cK47rD/9idyRoh1ghHcuX2P86tnc2ShoQNi
	1Vh6/HCUMqj1vGN3WbeMYArPDsMYlyo9U8I7Sp5/nvM3GOPHxxRYPqHgfUXX1r1IkcUcywStd7k
	ucBfSXpQr9/ESPVZJm+xoTKejojTPtgdHyTGVTq+cFz85svD68X1d0WqSEohlM+JjLasc20OVTm
	aIxUlHGbq4IJjW/RuJTicEZGdIpnOHHkeLU6ocnJZnIYmfiOUohLmo5mDwsqCjEeitDKdWLCX+x
	2z6OZiln77LNo06LHw0vN7mi8y1ZN2W8Prf9wgXS+krFNJVrVMT8HAPCaa92mZpaw5RnH64IFbj
	YzU3a0Zs/ozbz73NJOFgB2xxhI/6N
X-Received: by 2002:a05:6102:149e:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7cc2c29569emr283816137.4.1792160310034;
        Fri, 16 Oct 2026 07:18:30 -0700 (PDT)
X-Received: by 2002:a05:6102:149e:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7cc2c29569emr283809137.4.1792160309543;
        Fri, 16 Oct 2026 07:18:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm58835365e9.13.2026.10.16.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:18:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:18:09 +0200
Subject: [PATCH RFC libgpiod 2/3] tools: factor out line event formatting
 into tools-common
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-gpioctl-v1-2-8770622679b8@oss.qualcomm.com>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
In-Reply-To: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8412;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JpwgpB4hB1ogFmLYy02K35TTkji7RlVInsKhv6EQy3Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jIv49R+94TmeRuyc5kDKVmWtaN5qUX02C9st
 AnSAmDkGqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIyLwAKCRAFnS7L/zaE
 w5WJD/9JYsKMigqnlZovlwsplKCGuv/hd20XsUnb/zjesKXTIMeX5OTx1II7A7oCV9SvW5c1U3l
 3DuHAhpdIw18Cn/Kt8iAYJx91vk79YNHpAEhRIDiCF5GdJI7BfjEGYjO4l3FOxZODODuIJHEM3Y
 ABy4YmJ6V6P0rhp+1bcGRElZIMR9S5J936SkmMVTfyk1FHa6H+0aFfgC/eMSnU10rxyZLFHfzM2
 lE5TwFhJAAHyf95mC+jEr4sht65klBRk7BOHUjrVG+N1G1VZoTXzsdYOV1HjQD8x31Oa+acGlvC
 wU10zomyR9CRDUvuPA5/m8nE2nI1ACdUITJWLnEM5lD/9pNMXgRJPjLJeBelBkOhpK2JPhtDL9z
 ZXBtxADE9fYz4JMy5PYY+b5MWz5TfrIIkxKU3vBdkIUYxtMadkoQsZPnjjei/0xWZqeOP5Kjh2R
 kVeX/oELSOI2YlSYsmfTjtCQh5K/NhvuM77GUYnNaLcw5nDX5U/35dCB2O46vzKQfZcSuv3OkCu
 6g7zP0reuO4Bl7AFX/9mnuPiJ0jDcxgDIyOkcNqvkUB6/AjOb63xCarW/gjpEyUUpmGtfErsJMD
 K43TAggmqaJrLWhf3lUU4dYHbJLy1APAW0a37R8AsiytoOgFpj6YJCRnB/EVxPnYT9PEt8wme7i
 Xv8/B3Dor3dqfFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: zLDYWY84Uqu6L3N8qGu86bEr71QxXjgO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXwEYItD8+YPTo
 VqBab/ahwhScXMaRGFpUHdowPjzKExVVF4+dcQgLjPdQf6jz9FrRX8idPE378Pm8CgWTmOnyFMz
 B+65weJpPtHqCG4OXYc0Fk6txAj9Fvw=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad23237 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1Hda5a4XlNomHHihPq0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX4obzMyF8okyH
 /JThsd8ile7urjywZluN/syMza2yV989GOEOKPDT06LjCo2Du//cu29rEr7JDCY0NHV21WyD170
 Va4kFtBapuh5gHUwKrnB/Dj6ki7LTbYoWs82k8apNozffUy/BsA1hA4DMIgqiTJm92eEa4MP31R
 qL7SnSaWfqYF2EGAp4UeuT442UfM9UZckk+8VuzY8rmsCIqMpanpDmGTz/Z7ftG1eUj/zGGDuVI
 x9Fc0GbY62UIenDmj25/Pbc2u0Yzjex7qeYObuCdEaWardCP9dva20p+iEO8ZQiDGLya9qwQ+KF
 9c2ydHo79nWNcop6faRzUkgRR+NjENUhCqTvoSOwPGPRlPB6aF7RgaGNKgMLczChI6J8Ru4LW4E
 vCXWKRQRuIOl7ll4IM5Lre6QB7Pj77w5V6x9GKhdLIFHW4FB8B1CqLesjH3qAkbZXnEKedaqeOv
 mEsNiQDmYuqfgA71xCw==
X-Proofpoint-ORIG-GUID: zLDYWY84Uqu6L3N8qGu86bEr71QxXjgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Move helpers used by gpiomon for formatting of line events and printing
of the help text for format specifiers to tools-common so that both
gpiomon and the upcoming gpioctl can reuse the same code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpiomon.c      | 128 +++++++--------------------------------------------
 tools/tools-common.c | 100 ++++++++++++++++++++++++++++++++++++++++
 tools/tools-common.h |   4 ++
 3 files changed, 120 insertions(+), 112 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 2b9a69b8aea60d62d42b34dae510ac0a83e0f013..79006ed06e64f1a7fa0afc8e14904b915cf9f695 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -79,16 +79,7 @@ static void print_help(void)
 	printf("  -v, --version\t\toutput version information and exit\n");
 	print_chip_help();
 	print_period_help();
-	printf("\n");
-	printf("Format specifiers:\n");
-	printf("  %%o   GPIO line offset\n");
-	printf("  %%l   GPIO line name\n");
-	printf("  %%c   GPIO chip name\n");
-	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
-	printf("  %%E   edge event type ('rising' or 'falling')\n");
-	printf("  %%S   event timestamp as seconds\n");
-	printf("  %%U   event timestamp as UTC\n");
-	printf("  %%L   event timestamp as local time\n");
+	print_event_format_help(true);
 }
 
 static int parse_edges_or_die(const char *option)
@@ -254,115 +245,28 @@ static void print_banner(int num_lines, char **lines)
 	}
 }
 
-static void event_print_formatted(struct gpiod_edge_event *event,
-				  struct line_resolver *resolver, int chip_num,
-				  struct config *cfg)
-{
-	const char *lname, *prev, *curr;
-	unsigned int offset;
-	uint64_t evtime;
-	int evtype;
-	char fmt;
-
-	offset = gpiod_edge_event_get_line_offset(event);
-	evtime = gpiod_edge_event_get_timestamp_ns(event);
-	evtype = gpiod_edge_event_get_event_type(event);
-
-	for (prev = curr = cfg->fmt;;) {
-		curr = strchr(curr, '%');
-		if (!curr) {
-			fputs(prev, stdout);
-			break;
-		}
-
-		if (prev != curr)
-			fwrite(prev, curr - prev, 1, stdout);
-
-		fmt = *(curr + 1);
-
-		switch (fmt) {
-		case 'c':
-			fputs(get_chip_name(resolver, chip_num), stdout);
-			break;
-		case 'e':
-			printf("%d", evtype);
-			break;
-		case 'E':
-			if (evtype == GPIOD_EDGE_EVENT_RISING_EDGE)
-				fputs("rising", stdout);
-			else
-				fputs("falling", stdout);
-			break;
-		case 'l':
-			lname = get_line_name(resolver, chip_num, offset);
-			if (!lname)
-				lname = "unnamed";
-			fputs(lname, stdout);
-			break;
-		case 'L':
-			print_event_time(evtime, 2);
-			break;
-		case 'o':
-			printf("%u", offset);
-			break;
-		case 'S':
-			print_event_time(evtime, 0);
-			break;
-		case 'U':
-			print_event_time(evtime, 1);
-			break;
-		case '%':
-			fputc('%', stdout);
-			break;
-		case '\0':
-			fputc('%', stdout);
-			goto end;
-		default:
-			fwrite(curr, 2, 1, stdout);
-			break;
-		}
-
-		curr += 2;
-		prev = curr;
-	}
-
-end:
-	fputc('\n', stdout);
-}
-
-static void event_print_human_readable(struct gpiod_edge_event *event,
-				       struct line_resolver *resolver,
-				       int chip_num, struct config *cfg)
-{
-	unsigned int offset;
-	uint64_t evtime;
-
-	offset = gpiod_edge_event_get_line_offset(event);
-	evtime = gpiod_edge_event_get_timestamp_ns(event);
-
-	print_event_time(evtime, cfg->timestamp_fmt);
-
-	if (gpiod_edge_event_get_event_type(event) ==
-	    GPIOD_EDGE_EVENT_RISING_EDGE)
-		fputs("\trising\t", stdout);
-	else
-		fputs("\tfalling\t", stdout);
-
-	print_line_id(resolver, chip_num, offset, cfg->chip_id, cfg->unquoted);
-	fputc('\n', stdout);
-}
-
 static void event_print(struct gpiod_edge_event *event,
 			struct line_resolver *resolver, int chip_num,
 			struct config *cfg)
 {
+	const char *line_name, *chip_name;
+	unsigned int offset;
+
 	if (cfg->quiet)
 		return;
 
-	if (cfg->fmt)
-		event_print_formatted(event, resolver, chip_num, cfg);
-	else
-		event_print_human_readable(event, resolver, chip_num, cfg);
+	offset = gpiod_edge_event_get_line_offset(event);
+	line_name = get_line_name(resolver, chip_num, offset);
+	chip_name = cfg->chip_id ? get_chip_name(resolver, chip_num) : NULL;
+
+	print_event(gpiod_edge_event_get_timestamp_ns(event),
+		    offset,
+		    gpiod_edge_event_get_event_type(event),
+		    cfg->timestamp_fmt,
+		    cfg->fmt,
+		    line_name,
+		    chip_name,
+		    cfg->unquoted);
 }
 
 int main(int argc, char **argv)
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 6ac9517821f81ee8592493ed37237ef795c8f1a6..d6cfcb4fd6b1aa24b201556dbeab9f095b1bf5f0 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -305,6 +305,22 @@ void print_period_help(void)
 	printf("    microseconds respectively.\n");
 }
 
+void print_event_format_help(bool include_line_chip)
+{
+	printf("\n");
+	printf("Format specifiers:\n");
+	printf("  %%o   GPIO line offset\n");
+	if (include_line_chip) {
+		printf("  %%l   GPIO line name\n");
+		printf("  %%c   GPIO chip name\n");
+	}
+	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
+	printf("  %%E   edge event type ('rising' or 'falling')\n");
+	printf("  %%S   event timestamp as seconds\n");
+	printf("  %%U   event timestamp as UTC\n");
+	printf("  %%L   event timestamp as local time\n");
+}
+
 #define TIME_BUFFER_SIZE 20
 
 /*
@@ -337,6 +353,90 @@ void print_event_time(uint64_t evtime, int format)
 	}
 }
 
+void print_event(uint64_t timestamp_ns, unsigned int offset, int event_type,
+		 int timestamp_fmt, const char *fmt,
+		 const char *line_name, const char *chip_name, bool unquoted)
+{
+	const char *prev, *curr;
+	char spec;
+
+	if (!fmt) {
+		print_event_time(timestamp_ns, timestamp_fmt);
+		if (event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
+			fputs("\trising\t", stdout);
+		else
+			fputs("\tfalling\t", stdout);
+		if (!line_name) {
+			if (chip_name)
+				printf("%s %u", chip_name, offset);
+			else
+				printf("%u", offset);
+		} else {
+			if (chip_name)
+				printf("%s %u ", chip_name, offset);
+			printf(unquoted ? "%s" : "\"%s\"", line_name);
+		}
+		fputc('\n', stdout);
+		return;
+	}
+
+	for (prev = curr = fmt;;) {
+		curr = strchr(curr, '%');
+		if (!curr) {
+			fputs(prev, stdout);
+			break;
+		}
+
+		if (prev != curr)
+			fwrite(prev, curr - prev, 1, stdout);
+
+		spec = *(curr + 1);
+
+		switch (spec) {
+		case 'c':
+			fputs(chip_name ? chip_name : "unknown", stdout);
+			break;
+		case 'e':
+			printf("%d", event_type);
+			break;
+		case 'E':
+			fputs(event_type == GPIOD_EDGE_EVENT_RISING_EDGE ?
+			      "rising" : "falling", stdout);
+			break;
+		case 'l':
+			fputs(line_name ? line_name : "unnamed", stdout);
+			break;
+		case 'L':
+			print_event_time(timestamp_ns, 2);
+			break;
+		case 'o':
+			printf("%u", offset);
+			break;
+		case 'S':
+			print_event_time(timestamp_ns, 0);
+			break;
+		case 'U':
+			print_event_time(timestamp_ns, 1);
+			break;
+		case '%':
+			fputc('%', stdout);
+			break;
+		case '\0':
+			fputc('%', stdout);
+			goto end;
+		default:
+			fwrite(curr, 2, 1, stdout);
+			break;
+		}
+
+		curr += 2;
+		prev = curr;
+	}
+
+end:
+	fputc('\n', stdout);
+}
+
 static void print_bias(struct gpiod_line_info *info)
 {
 	const char *name;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 5083b0908584f98a00321ca3fadf46f55c0a3066..95517fcd016de89e0b01c3ffc6630a30c67ba933 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -48,7 +48,11 @@ unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
 void print_chip_help(void);
 void print_period_help(void);
+void print_event_format_help(bool include_line_chip);
 void print_event_time(uint64_t evtime, int format);
+void print_event(uint64_t timestamp_ns, unsigned int offset, int event_type,
+		 int timestamp_fmt, const char *fmt,
+		 const char *line_name, const char *chip_name, bool unquoted);
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings);
 void print_line_id(struct line_resolver *resolver, int chip_num,
 		   unsigned int offset, const char *chip_id, bool unquoted);

-- 
2.47.3

