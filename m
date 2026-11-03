Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715434;
	b=RnrbglHC+T6i4PGMkLyVsTN8nzTkHhsBavukMEtAH38mfmLLD8h9+LVWdoqWWJ7ulyk2
	 +2SULjaO5x2ih+sPV13KUAB04F7xRqIvUPa85ZLU0ilWwG2XsT2pXdwSZMTzk/D0p06UQ
	 ia/Gt8aQBi5dzbAfpyOi4tn1vKjuRhBcBL8ByS5UUkjdl3iRYrMSDr4DsqSthL4lngy/C
	 ht6dCkyztNEY5JuZVvat1/uBnJMJNdNyBE+quq1OtTfJyd52Xov0Knvln3vVuGDbex6nK
	 k293cdsVbtb7vyMYZTx7SlRMnWOUb5NoBtiC+OK3ezs3VZpYqGOQWeMyv1YnHeJFSdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uOYycAAtAQ4D81sKOGWDwVxcCgL6XP3Q2w5Ymzm+ysw=;
	b=X3E/sMlCGuD/oAKyd83nEINJYFb8X8yyPe1GyJgbWN+Uwc3HS7+nr4wSkESc0jn8OgMN
	 XdH7JvzYScsDV5dMUktBAGXM++p0n/inz0MpYtoXoQfJMtA0ib3V/8rg8VTUKREUnA6ZE
	 cmvTCn9wks1/bk+7PEyoFkKGTJ1GKKqfCCeGZehetzdKdCryPfdTILuHfp+Uv9ESv3vwW
	 opgydFG9DcBrwV9hbM5Ws051IHgBZGwvq0ZF12dtc7m85fojtSc/gn+iXHUzgD68eqjuD
	 PsFrwBWbvPRrJ1/RhXWVG91I5LqF63NB7pVA9wmH4V7DXPhExhSUy9P7HMYxfep5lNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJJfNIct;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxRWhD1x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A1606A326
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJJfNIct;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxRWhD1x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9xpn2727731
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOYycAAtAQ4D81sKOGWDwVxcCgL6XP3Q2w5Ymzm+ysw=; b=FJJfNIctq0UAEbU5
	iG2SR2HKsX4gPuhXOTcBtEw8scmVdWCPwD5ZqZALDUQxRkIbCxlG8MZuq99LZbpB
	VM8Um+5+mNOvVMvbAn8/3/t5JTsMswdfWhGOpJJdJLtQiIep+FdDkzKNtTsyXyHq
	XyNOokc7HIcbBJOVY4D7b6L+CA/Rv1RhbGLO0APEnLGwcpymYX55ZhpjXSGVjYRi
	kQt6qMk2/exxMEg8jSvKp+w7k6EtysUvGdCyMdvEiMMXlLDtJW0ZSxJDgdEoPZVm
	lPCwHx0NtJBCxGY65Awylp3OftmaKDQWPmKBzinlxGmRjbSExTiWoAPi3kUUHiBQ
	3H2i+A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bg1ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 14:17:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99082f450bfso3277885241.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 06:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715432; x=1794320232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOYycAAtAQ4D81sKOGWDwVxcCgL6XP3Q2w5Ymzm+ysw=;
        b=fxRWhD1xhb6nXs57ZIE0VKrMqqJvWEFJ6qW0ooN0IRze5lYNQXxgvPz/wIAVfYmRTO
         ppscYuMgdrTkMtZJ7+RbIQXnrKFcgOg0bfYE9PJKxjJwrvXvGsEVoFHmhgLfjvfc41nm
         ZRfe186MX6uqVeES4Y+KM1yPv2Y6jL3k6XoIdfvyVCEbEjFS9OvXLqf48jIXF/dus6C1
         DJX/pcGZvrT1pxxmUcm9nKFN5JwkwRjueT303Qal4BsHKRZgSsmMSE3O7nKs29o09xC3
         p36FJt28htyUCzvpmoNylLhwQ9VlbKI99V5np6oOyNyo8DWBUGNY/Xb2TA82+d6DCtso
         V54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715432; x=1794320232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOYycAAtAQ4D81sKOGWDwVxcCgL6XP3Q2w5Ymzm+ysw=;
        b=RUuY+MDECLV9NIuLIslilm78ncgVelmKloC6BQWblWRZdJ4PdY7Re578JjsM/9OYLJ
         tUq1tvwy351QXOLPZY+Nn4j5crdCZOwuwG98rYy726lv8LCSIm47ICM4GfcgDVRYWbwe
         L/g5c8vuEp0HNzikOHl+OF3vT0/CJ/pg4imRvJVHL0oilvfWo9kPwQWrRDAXOnLUviNJ
         cKWTYjkUEhJWPsKl4t/eipkMmFOL/PPYzg4Cjbpe2F1veiNsB1u6QslNf76ed2Rl59Cn
         1V7mUIiFEh1GYdb8YuOAVfTY1sZwM1PRWBi/K50aXCgwRZOAKSaXicMa8/8V3jQKAnX5
         IxPA==
X-Gm-Message-State: APuU4Z9XMHXPkzKnUhxfbL7hfBq8NXc+2+yPXXDPUfSKnfcY352kVlkv
	V72rGZclxjsuoxgOXSCFaMSwNik3JiIx3yyZMS1eSeozMKBDZzMlvoFlwJYSw8tdv5VHBQf+3Ms
	XuNL0hyNsXGifkkZrnmZ5NMXjkS7BHxW2pkp0isBkM68skqR8/iMERj+CbGLJYGzjfZokkQwr
X-Gm-Gg: AYBFou0jK5200G/GjeloiXnikQHEohWTEeRBpur58RiO8zX4O5O2qRVHNWfswJzolSr
	cIZHKERDPuV+tnybqkOARXMt2MikkdUaky3qaFeCnFqlidW5xZDRApWoB5Io0nFGjFjiIdCTey/
	hpq+g6YfS7zZEQa2crOVphKqTnv8/UtDKzKeBuXjv8QwfYYl1uk9/Y7iie1JlSPYJCNr/iU23HZ
	+cvm5VNMnf6qUPhGz4AH56YQlzExnBtDYPlB0fVqWyvA/J/HbNAQ027Flsbgts+BL2J8B3TpOCA
	inF0FlxHb+pqEDSGVU8HFKQNu4orKJaY+lFyCLofi4PQo64Ie+AD9f1uh3kV//zuG2fwIEPFpq8
	yTRqP1SvKENXfQpmgXFmBWAI6sjV8BtNtx1RJuQVIhKw6wt7Zj50MhMUQ1pxR3+DaSxE/ZPndrT
	kEkQ==
X-Received: by 2002:a05:6102:6cc:b0:7d0:6f1c:b3fc with SMTP id ada2fe7eead31-7d072519890mr5698978137.0.1793715432227;
        Tue, 03 Nov 2026 06:17:12 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:6f1c:b3fc with SMTP id ada2fe7eead31-7d072519890mr5698967137.0.1793715431656;
        Tue, 03 Nov 2026 06:17:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27034897f8f.26.2026.11.03.06.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:17:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:17:02 +0100
Subject: [PATCH libgpiod v2 2/4] tools: factor out line event formatting
 into tools-common
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
Message-Id: <20261103-gpioctl-v2-2-1660aa3dbe5b@oss.qualcomm.com>
References: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
In-Reply-To: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hj2TuqYi2tRBVMSRUsJ8gcaKhGY0DaPDK3y3+wviGu4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ezicssPsFH0K98IUXq+kN6mwz24rIQviloF4
 YAPUPzp32mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauns4gAKCRAFnS7L/zaE
 wz+KD/0W6fuv++fnyDPMNqtqYATKScFZvf84oHYaUbv/17QNtsretB+4YuUXKPaX4FtaJcL6LNT
 WgsIrUq5cmSvV3aLMfdM/Q0MZMHOlLDBrjCbV01c9C5o6pXlJANABjqTgE4RzWkRSNV/0zzedZD
 5xPFUw0juJ73Zk3//PG8yezPDdVctQmy327OeFjLgx+5oJlpMBqCMTeu0/GDyYDekfB47nrT+JG
 24j5lRDGwkOE2p44c4R/+bxQjXTXBoit/L71Aq+aq3ciMtdvcoSBalku12uJWBUmwb5C+1Ow3OG
 n9eFpqPkBC4/iOjSQzxKVmlH6bGDXq5WqoXI5f1vw6iY4U/WVthfPlh0jCUe7qS8422H+ASD/5l
 sss1nUurr1Fl9ckNRilS/uM/BGp0anV6J7Wf86PuKv7BsI3LJdcHMu4j/7XOFkJjv4riOuPqvFC
 6v1WEUDFPis/2IsIWVWoTSMhdbZzGMGuOJRDWNO3wpfZZK0ZxJ/VSNZ3C8JBAXTr/u5grTargN9
 tzuy7yXF0SF7x21JbgCRK8xz3nCVxQcAX5UmxCkOfIpRhczdRRAW+8FzNnLy2dSAE/XZP491KIG
 1Q91iY+UQaDTtoN/vyeaw0Ud1d53wPKpTDT38ADYapy1LwZwW6Veoz2/GkjFj8zU5z4BPo/tcBN
 zFtfVUlhEzy4hTA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX5am33hIpj0cr
 JltMvtDiSYq414GaK0T0EehicInN77mAQD+/30RMM1ijIVG90KZxAJ8O4tHXkS5762PJvEhDOEc
 4imx1wiR6fsPRwQG43pGRydWRqeLcQk=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6ae9ece9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uYVbPbFms7MKtc3rY-AA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Hh-E9Fw7VNbaEid6F0EPV-dzOyc3JgBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfXypXUCncE92i3
 jO6qQ5XxlEpg+tGVpH/94PIieYUkYP/Sj8pvDhniJyRI+LKc8QTtMwdI0WY2Bxwaw3uG+65BJF7
 61XC97Vz8tc/uLz2uKdloh6IC3zi/uNQqdD0y3sf/ww02IbNdapXEnowuxaWgi2srd2cDdgGaf6
 KH+lIdZhMPL7V/KM1Nxzxs7yFxvXnTOOhz3weiS8Vuhi7pcKug3HPE2mIaTohie2wyevaF+pc7W
 RWaCY/wqE6citD2v5T+vKHmYKYMCCfqkscWEpNY9W4Hyr7DOLCuCFBN4AZqlY818kyMW4/8JY+P
 IKsAyYV01mxk1cjO19qnKI6JKzG8WqTre5wlpbIWf2p9e199ehksbm6/Sac3UhVKbhDANgIBXIN
 ru+TtVpoEVZEbYBVKkTr8yDrnlhvJPjV6kBPhErBNC/ezsN7mKj0E2bGZPS4mrwUkfXyBfK9fvL
 crjn5Yfl+OBNzirR5oA==
X-Proofpoint-GUID: Hh-E9Fw7VNbaEid6F0EPV-dzOyc3JgBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

Move helpers used by gpiomon for formatting of line events and printing
of the help text for format specifiers to tools-common so that both
gpiomon and the upcoming gpioctl can reuse the same code. While at it:
refactor the code to avoid taking nine positional arguments in
print_event() in favor of structs holding the formatting options and the
event details.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/gpiomon.c      | 128 ++++++----------------------------------------
 tools/tools-common.c | 142 ++++++++++++++++++++++++++++++++++++++++++++++-----
 tools/tools-common.h |  20 ++++++++
 3 files changed, 166 insertions(+), 124 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 2b9a69b8aea60d62d42b34dae510ac0a83e0f013..2846603173ec3ddf44d79764e027cbead751d3ed 100644
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
+	print_event_format_help();
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
+	struct event_format_opts opts = {
+		.timestamp_fmt = cfg->timestamp_fmt,
+		.fmt = cfg->fmt,
+		.show_chip = !!cfg->chip_id,
+		.unquoted = cfg->unquoted,
+	};
+	struct event_info ev = { };
+
 	if (cfg->quiet)
 		return;
 
-	if (cfg->fmt)
-		event_print_formatted(event, resolver, chip_num, cfg);
-	else
-		event_print_human_readable(event, resolver, chip_num, cfg);
+	ev.timestamp_ns = gpiod_edge_event_get_timestamp_ns(event);
+	ev.offset = gpiod_edge_event_get_line_offset(event);
+	ev.event_type = gpiod_edge_event_get_event_type(event);
+	ev.line_name = get_line_name(resolver, chip_num, ev.offset);
+	ev.chip_name = get_chip_name(resolver, chip_num);
+
+	print_event(&ev, &opts);
 }
 
 int main(int argc, char **argv)
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 4a61ec672576a19a67b909603c83019fc2b9885e..eec51acdb3110bfeb940f4ff0f925bec1c639b7c 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -325,6 +325,20 @@ void print_period_help(void)
 	printf("    microseconds respectively.\n");
 }
 
+void print_event_format_help(void)
+{
+	printf("\n");
+	printf("Format specifiers:\n");
+	printf("  %%o   GPIO line offset\n");
+	printf("  %%l   GPIO line name\n");
+	printf("  %%c   GPIO chip name\n");
+	printf("  %%e   numeric edge event type ('1' - rising or '2' - falling)\n");
+	printf("  %%E   edge event type ('rising' or 'falling')\n");
+	printf("  %%S   event timestamp as seconds\n");
+	printf("  %%U   event timestamp as UTC\n");
+	printf("  %%L   event timestamp as local time\n");
+}
+
 #define TIME_BUFFER_SIZE 20
 
 /*
@@ -357,6 +371,119 @@ void print_event_time(uint64_t evtime, int format)
 	}
 }
 
+/*
+ * Print the line as 'chip offset "name"' or just '"name"' if show_chip is
+ * false. Lines without a name are always identified by the chip name, if
+ * known, and the offset.
+ */
+static void print_line_desc(const char *chip_name, unsigned int offset,
+			    const char *line_name, bool show_chip,
+			    bool unquoted)
+{
+	if (!line_name) {
+		if (chip_name)
+			printf("%s %u", chip_name, offset);
+		else
+			printf("%u", offset);
+		return;
+	}
+
+	if (show_chip && chip_name)
+		printf("%s %u ", chip_name, offset);
+
+	printf(unquoted ? "%s" : "\"%s\"", line_name);
+}
+
+static void print_event_human_readable(const struct event_info *ev,
+				       const struct event_format_opts *opts)
+{
+	print_event_time(ev->timestamp_ns, opts->timestamp_fmt);
+	if (ev->event_type == GPIOD_EDGE_EVENT_RISING_EDGE)
+		fputs("\trising\t", stdout);
+	else
+		fputs("\tfalling\t", stdout);
+	print_line_desc(ev->chip_name, ev->offset, ev->line_name,
+			opts->show_chip, opts->unquoted);
+	fputc('\n', stdout);
+}
+
+static void print_event_formatted(const struct event_info *ev,
+				  const struct event_format_opts *opts)
+{
+	const char *prev, *curr;
+	char spec;
+
+	for (prev = curr = opts->fmt;; curr += 2, prev = curr) {
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
+			fputs(ev->chip_name ? ev->chip_name : "unknown", stdout);
+			break;
+		case 'e':
+			printf("%d", ev->event_type);
+			break;
+		case 'E':
+			fputs(ev->event_type == GPIOD_EDGE_EVENT_RISING_EDGE ?
+			      "rising" : "falling", stdout);
+			break;
+		case 'l':
+			fputs(ev->line_name ? ev->line_name : "unnamed", stdout);
+			break;
+		case 'L':
+			print_event_time(ev->timestamp_ns, 2);
+			break;
+		case 'o':
+			printf("%u", ev->offset);
+			break;
+		case 'S':
+			print_event_time(ev->timestamp_ns, 0);
+			break;
+		case 'U':
+			print_event_time(ev->timestamp_ns, 1);
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
+	}
+
+end:
+	fputc('\n', stdout);
+}
+
+/*
+ * Print an edge event either in the default human-readable format or, if fmt
+ * is set, according to it.
+ *
+ * The chip name is always used for the %c specifier and to identify lines
+ * without a name. show_chip only controls whether it's printed before the
+ * name of a named line in the default format.
+ */
+void print_event(const struct event_info *ev,
+		 const struct event_format_opts *opts)
+{
+	if (opts->fmt)
+		print_event_formatted(ev, opts);
+	else
+		print_event_human_readable(ev, opts);
+}
+
 static void print_bias(struct gpiod_line_info *info)
 {
 	const char *name;
@@ -493,18 +620,9 @@ void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings)
 void print_line_id(struct line_resolver *resolver, int chip_num,
 		   unsigned int offset, const char *chip_id, bool unquoted)
 {
-	const char *lname, *fmt;
-
-	lname = get_line_name(resolver, chip_num, offset);
-	if (!lname) {
-		printf("%s %u", get_chip_name(resolver, chip_num), offset);
-		return;
-	}
-	if (chip_id)
-		printf("%s %u ", get_chip_name(resolver, chip_num), offset);
-
-	fmt = unquoted ? "%s" : "\"%s\"";
-	printf(fmt, lname);
+	print_line_desc(get_chip_name(resolver, chip_num), offset,
+			get_line_name(resolver, chip_num, offset), !!chip_id,
+			unquoted);
 }
 
 void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
diff --git a/tools/tools-common.h b/tools/tools-common.h
index cd07530b8842be005a5875d347040f88e86a9bf1..e981c7c74a98ba4e0cdaa19361e8229a2ecd158e 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -48,7 +48,27 @@ unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
 void print_chip_help(void);
 void print_period_help(void);
+void print_event_format_help(void);
 void print_event_time(uint64_t evtime, int format);
+
+struct event_info {
+	uint64_t timestamp_ns;
+	unsigned int offset;
+	int event_type;
+	const char *line_name;
+	const char *chip_name;
+};
+
+struct event_format_opts {
+	int timestamp_fmt;
+	const char *fmt;
+	bool show_chip;
+	bool unquoted;
+};
+
+void print_event(const struct event_info *ev,
+		 const struct event_format_opts *opts);
+
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings);
 void print_line_id(struct line_resolver *resolver, int chip_num,
 		   unsigned int offset, const char *chip_id, bool unquoted);

-- 
2.47.3

