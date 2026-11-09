Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220038;
	b=P41n2DInR/twwN3ncJ7a7GOUQcjkjFCU1Kx9SNhCsSZgEDAc5A2gyJAcJBBxZfA/1RRm
	 Rua7fCaSe9Id9TcKtxnCAegSsEiY2YO+XoPN3yVZ7uPJo7beJCVZXx3VVqpa6inHhYEYV
	 rMKHw0B0L8sHg3Zw7PvpGQDt7YaGYdgpS9MWoLKswBsk87SdQE+/UZcjb2nmvBGFf4J+T
	 lPpNsalvjJ6EsAflsEji0IrFpWJcFG469gboXFerXqzxrKfGZX2QQ5c/w4n2MBO3fHzil
	 6HXyUhY+FgXQX+FcUeY5bI0TMbpzhbHQtOo/Og+BzDQgf8fZGmQsDAYjyo/dh9PHt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
	b=sRXy6aIUF9BFS++wrIAVqQ3fNuHuYwM+7wOBfxvFeOwX99fJMfc1nlqYG4DeXQOd8bCR
	 VRLt9h4yXN+3f954Axxw0MLPbGtxoC34n5xtdZqpZ8It+6CaNT+sOoMndBMEbxt7P6W4A
	 mMD7IZ6ah++xGIUAEJpQ0L8MyY+hV4YWeLa/9tSdeTN3/E5VCmje8c2gpREpqO633SAW2
	 th9seR3e5/QCt+PlHKGw/eVHjFhmktdmJoLPdUbCYQGLNcwX6KtliydVOuZeXw4bO23mF
	 NRP1ZWPRR/DQHb97FTCSO8aMNs/b2EhIyV6VQcbzBIAcpP6XQJgWMNOJ/nYwFs6ABmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSeFggLU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAcnP+n1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4A606A33A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C4A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSeFggLU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jAcnP+n1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uuA23792031
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 10:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=; b=bSeFggLUQf9br2vd
	llBX070yz2soSCAcyEwwWbv0OGZ9jPrD+AzyG3PJMNtynYhzvXO3s2AmDMoSZd44
	ACyowWt8OljDtAJ/3fXwlelQvZgzEg684YoitesuQvL58lyX9QjRW27EM96iQfah
	fuQcFXNdqne0eylcSIbaBpzQzKxhdZM2vTkncEYYwG1dzsytbkgSf2ugQHR4ULwc
	ko/tjR6FoL9sE4hoPr6qztZbznuOTsZTy+2lWqJ8EFfDKUabvGPr8NNeTIJvD4z8
	rMrhHOZu9bNZzgkhEnw7xm2ZhQoF2vRgJV2q8tjRbv0n1luRbm50D0nKnHxt3d06
	uRWdQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwy6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 10:27:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946811b8f8cso63529585a.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 02:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220036; x=1794824836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
        b=jAcnP+n1dTNqTb6/8pOrZ0E3cLePyYQx+3DvAw+GMCudAODTD2lfXTcXO67JMSCynX
         5HLm8Pi8hH2QwJPtLg8ENkEVr8waZyT+WJBf3tR6XcjcHnqZI0vwTixNn56pQntbunv8
         MYZkBY/RcH0nKJaN5uvEnrhRP4345PrJUrNF2/L7MwASZHj1Y9pg9axXYzeGowPWS45q
         GIeUGlseLep9m5uKZydK82u257zHuJKy+UVRKtttAgXTdJlZG+Q6SW5zI7nxkQGaZbNF
         fVq1Y+TWnDlMiM+79MQAJcExoDpa8SMXqQrem3FYMGtp3djWJKaJ6uSJfMcpoMhJ7Q1N
         aSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220036; x=1794824836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGMp5Xv2F7MBsmsNglfBPzggeajZjRaIYrjZpMByBiM=;
        b=zT4IZ5nqigU88hNcoVzbsfOBwPpRrxjCpvqNGH6XfWu7WKT9SfQjFGE9X4BnaQgYQs
         7jJlepac8xIiP7UjhoLKtU0Yi0oJdSNxTGds0e/Ujww+XsIHYIhfAXWjhRX5v25oRA4t
         bdZD+rHRVl6QWEzceHhA6h8nHR4Rdk3n/3aewPH13Fv6Mx2xAaJS67qscuQkcZ20FNHV
         omqqwicv1gdNsDtHN9WGWEOrLvs8FkHgqpyQKntJcXZ/GQBZIa/rNKxDu+8cYvmG1w5L
         Rs25X3IQDNpRlPlPyzxmssXnonn26fVP2wLNorWop52Bbx5C5EnvDkPJJU57qRdC0qlR
         qDlw==
X-Gm-Message-State: APuU4Z94wVByIsDvvqVAoOwNWySYfVTty7O/HAXwVPldyvE9W+Fst1TD
	eIryH24Ks7uxdGAwahlzi7cq9j9d4rAM3dvFuoBCmWgouyHLLHjHaShpt4z8fXKnTaZ+Ot7QVf6
	Z2e9SBMC3KoEhQ2bq8q5AsgfKVKkRDIbakM/DeQzj/bIBDOhIDTSuoru62FQtpvChJMZFM/ia
X-Gm-Gg: AYBFou35A7jEUWPVyfhZH4dSuqQE8xSVbxFHkxtYfVOSi3LZyrIYqs5DLdrRrGShbBB
	Fi/+1IK5KRu9ptQoz3tf3pZH1klMfLb68862TZGhBZzsuwYebNQhYd4vSy6Ycs65n66DyYRhvzO
	RzdAX55BUItn6p/M4t/Qak9oeDYqfjh59wHp7R5YV5rkB3Vku7PIGdS/b+0wmdWumUgoHvUgBf7
	0flUf0rvF76XZB8gys5QRCvTc1BXplvJcQqibKVvSGubXpb3+N9Vjl1lhf2+rk9Y91bcRPQBlxE
	kgMNex6gckUaL9k1XkPUrrAk7BgitwO7lZ81lIaq5/nUHrfW5G8Xyk11zBVAuAcxxPNOvApScXs
	1mH6VmyH6IzEqrbFsWbWCYIUibFyL8bSbB2Nv/l7ViErHAZqSrFsZtfjIuZTk3twRLZcpPt+M3Q
	27oFQnMlhysUYUE+P1Eb0v3aP5kEcTOS8xUDGzQlN1oN4qz91xiS67HDXTjxyJY9U=
X-Received: by 2002:a05:620a:3711:b0:93f:94b:81ce with SMTP id af79cd13be357-947842dadbamr549602285a.81.1794220035432;
        Mon, 09 Nov 2026 02:27:15 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:93f:94b:81ce with SMTP id af79cd13be357-947842dadbamr549598285a.81.1794220034690;
        Mon, 09 Nov 2026 02:27:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:27:07 +0100
Subject: [PATCH v2 3/5] gpiolib: clear debounce period before the
 "requested" flag
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
Message-Id: <20261109-gpio-desc-flags-atomic-v2-3-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjLYAqTAwPoBQw3HhJEzzNxlWBVNFUeFcmzGHg5iRNk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7ImRKgIQexAh/PTOgpovkCu5YsmGAehnAI
 3ny9JTKuZ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 w4dGEACpjw8Nv+ql7+F/0HXFpyTMxcQKIFzl73xEmWwbMNDn6jdFIrCO2luK4vOY0Uhp+1LYloe
 3ZjjM7Ku9F6kE0HBNol9lYyebhURXxW4JFTez/Qo4IAGi30nE7MtRgvkI+mwotqNSzqWdKir0hf
 aXib5cDj7mKfvDP2aRiPmZf7wAi8KttBGboAd77dOwevp5qwZHyRhi9Y8NFvh+n+63+8dM8rmAy
 8m0uy0P/rt2nEsurhY4fWUnA/cz12UEjhdyQaLZ1EBMNwT1z1HLD05Ps1PhWTYNI0ahUPyRHmpB
 M/7eawggfjuvOQq0DZPcI73FyJSEs3RLox7MPK46li5WeyRDzTV8X79dXDZTpLyUoMeQM/5mqc0
 fwqEutrHcWqHv89qp8tJrfUdBRHpKVVbuCJPI7afKnPuN0hGIQs7bwxrxCGxKMieGLfANPDDb1z
 8Ckrok9HG2+/FlsH9kIUZNtXleiEfJL4cEHbVBX53Ka/w/I0jRoVBpNOtPOsjLoKuVjzllucjBQ
 SC+mmBDWuUASOzwAf0CrBQ6rYaMLRd2k83tUIZn9AXQ6ZN1hH/BFH1QG9HiBvKE5WjDeA720VY2
 NgdkojUdeJwZomF0tzjG/4Dl+ORgz7UzDpu1To6P8INrM1P5wG+aT5sm5wkuU9goCXe0iKxJ5dT
 Ic4Aga8IT6RGxZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX7K/1+ZhYbxgB
 e5JrziFO0R/XOWnsK0QJiwD7Ob/Sog15j1HT4sGTK3jtz76dLONr3JRffgH4r37rXCdOz1kbRAr
 d5TnTaWKRzB71u79bYlJbtxBrCR6WGglEeEYAso8yXAXdQBLabJSCgyZC2y+wTZqsO51if0SIS1
 T6bKYHZa5zkAet4px9mKZ43rg4pmY4BxCBEZKAzhiuvOexKaBpZJvu8ttDYhQlf/f/Yf0WTvDhS
 q9Fmh03Wgk/+tDFZ0aFKN4hnLE4R/jQTdBHNj2ldLTAP02eODd7nfHa+JySN6qnuzWp4NTwS4XT
 YNwJBJXYsB87DpZuIpmyMtCK3eAAA92ACjjCUV4B9w32FddCL8u5m9CWLkqPlRq+p0q51EZXXQM
 5Hwg9BD5oit1bkxZTeo5T0GEwqgjQRkT7ONFB3AuldfYw1S/AL5Sts9FY79LCEeHk0bpOTzTLmr
 hk7Y8D2ii8FA8E65gBw==
X-Proofpoint-ORIG-GUID: OJqa8cEBQZZlQXA-U8NK6dm0VgUao6uJ
X-Proofpoint-GUID: OJqa8cEBQZZlQXA-U8NK6dm0VgUao6uJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX6H7KbZLRvHPM
 anXZ3dcvRra0J9wGN07ItRRQohdj/0Q1B16tIg7DuPwZldmgxaNoXVcB8J9x4r6Iy5Jlv4HLyy8
 5pyXIvl0syO0IXn7eO8Oz/PEp0Ohd24=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1a005 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_qOFVmDGdm6F56flM3oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

The debounce_period_us field is protected by the GPIOD_FLAG_REQUESTED
flag, so it should be cleared before the flag, else it could potentially
race with a new request.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Closes: https://lore.kernel.org/all/20261105042905.GB8436@rigel/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638..af2d67d977f4925558ab77c34b37c3c29bd12a6f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2693,6 +2693,10 @@ void gpiod_free_commit(struct gpio_desc *desc)
 		if (guard.gc->free)
 			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
 
+#ifdef CONFIG_GPIO_CDEV
+		WRITE_ONCE(desc->debounce_period_us, 0);
+#endif
+
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
 		clear_bit(GPIOD_FLAG_OPEN_DRAIN, &flags);
@@ -2710,9 +2714,6 @@ void gpiod_free_commit(struct gpio_desc *desc)
 #endif
 		desc_set_label(desc, NULL);
 		WRITE_ONCE(desc->flags, flags);
-#ifdef CONFIG_GPIO_CDEV
-		WRITE_ONCE(desc->debounce_period_us, 0);
-#endif
 		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_RELEASED);
 	}
 }

-- 
2.47.3

