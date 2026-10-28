Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190928;
	b=lbsBP6X7Sj2oWF8a5ktUXSDQoD0R/KhhWDkg2rqMkTwGiehVmz7ldRhpmFG8zFe3Bh8S
	 NGkZsmFoZDEMY4T+j9POoBSDgPPH6Z7Z+aZhtvtM+ujP6XZiSXAG+HC+cH7ktkQrA/Gvw
	 K8EO7SaP1rMg0z4oKqbwsm9DEQOxvmxfKqAl84zZqozPHzE6ZUDXcYatKEIVfER6WeOjU
	 CgQZCkPbTu8b6y4hkDhHtTASpPKAcVXisTQ8xHqlC8FqEiPiGwEuOQ8061KT1IJ/v5Rev
	 scwkgov3ezN/1dTJYKEmNwedGABQRdExpJp89AYTBUyMnSa4AqUSI3dpFonNfcSWjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
	b=THnvIHCD9XJvp1YakC2QW5GK1mJE7PszP/jCIkiZa6MITiiOTMbcyQ4NKaSuHDMxMPX3
	 WYqee+iJMqP14zihiIT4kCp5YrBIWWyRKB3y4LjMmpSLYxIYb/xdJPVQCKucBNZep7eZS
	 mmAVkgW3INpXxmRO5O1ziSOMzDkGT33JMwXlEMVUzYgUjGK3f1ckzAg6I/mUsyr4OgqMs
	 c9Gnk16xxfsAdEeuBKMu0KCmmHN+57T+faOBF+qBm5Djq6nQk5zHK7nlO0IXp7UWt1N5s
	 eamhRpL8DdZSlVtuIBM9L/Q510MqPCnIVVpGn26KPF9MCxi9lhKRUOhnY18UU4ZXDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81F606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B81F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4fk4154780
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VrXv9WGeoSL
	tqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=; b=EOmFV3Ci++b0gq1Fg/2pk4+xwB7
	fbyg5BdNRkHs9tcWltuHb/jt920jdY/GobZdEonla8s8NX3ZJ+TgFPAGmly9/9Ai
	Hst9zg6sV2lI4lASwyQI8V9Y631t5/G+3hNsFpEJSUW1ZSqHWc6rauFyFBrfuI/o
	EzqxYqULaV5kWkMPiXUkILSe6B/Bmhax2ECYKTGSRgAL38L7NhY2eUDyWUg/cBg/
	mZSpnoo57OSqLSr8MLjdTPoGs9YK1Nkb5rGBPWUXle3FiG6yB4bXBVZ7yOVC7PUv
	wUeHDk3rsN1eY2B382XXxM8rRZWtX3yuoxkQmHmD/a/f8GRfuC0krArqlEQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0t6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so1688106eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190925; x=1793795725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=PtiODmxGWSeqyiZXlQ/9FVMQhWWz7irSNj2gqTd6qT2JUHTH0ptJs1nAwg7k8Ib8i9
         4CIpC7E8iFqxl2R8G4PCYVrwmEk0nlPDxKXq6LUvUZxHi8U17j/EaoyxzWefml9bjXpz
         KcOFzgYbeaoRJhskuopg6NuUCfpXQBig4PJZ5O1g+jKksN5Rgs84v2M1aK/CzgnxM1fZ
         MtenjcrJ3H2Sam9YJtXm+ErAoHwsxGCriuh6KYcHVZheEcKpwdov7deYsodiIdmBdJD8
         el3ZqP7RO0OLLY6xAHWAX/3N0AG4YSXsxTlan8ra+5TKDrgV0aUUO9ygoQMI1D3Om7xP
         7a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190925; x=1793795725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=LJMWxMEwhzNAUVA828hjS6+jcvubgA66lRfzis9os3yPcAN3rKkBd9F+Z1/ZII+I7B
         Rrk94wE2SPE6HD0QL8ncOFzSutDtu1BbRaLx9/lc8sSHhgjMQaOte+yCbbb0X1KFRXJY
         qKSMrqeOiJ9JNDg9My2pn7pFon/0Au5UooWQCqgxsHXz7qu+i+JlGP4YPlvO+4AdwnSu
         FB16fU7/7yeMedeo391nDNsgoJfGGl5TXLt3hmcPC+C8NDfhzGlXtiVTcsAdLQPanAbD
         o38zTV8sQVy9zeflN94E2zHaz/teBM8Va9KN5odfhf+82cZ1wcTobBEeIvy7DqBQR5JU
         OI/w==
X-Gm-Message-State: AFq9FYIzbxOD0Op8JuF1fEB9OPiWSgwfOluGzhn1qo73/ojxVtgiOMTN
	rHiCfJpmoB1/StHxBhL1nGTvg3hEfHSryKuEarKiRa6maxZMs+/1H4OoTPJ6kqAlI7u2LQ3ELqv
	ZrrlM5FIEHJNYj28WPKE1UnE8S1RpOGhCQ63RPe2vwPG90OSYvvMukhNg09PJwMvu
X-Gm-Gg: AYBFou0e+JkzF82MZE6grlYZlwcQyUVsFhRlp+Y0sHfrtrfyEWfV/p6ruh4x5EJUg0b
	Fh3uWChSiA3TsJWO1hwYIpw4f8OTYFY/mJcbEaX9wLq4uF+23T+iUIWvdn9BpteCqVsfcuHM0ur
	iWgO49Z7i2fX9InbPYKB7UyVsHAtaHckMfr2sGizELqoA0lG5MZe9NVym8GWAIlmZ93mgu+1x7E
	ua1pOTOxF4Q0KrventdMGJRG23C091EKJ6fM8vMdk3aBInsAoPBzvx5EEfyqMBH3fgDhz/Axc+4
	LsKjaUWcDnWJ/dhtxuE7QoYUbawl48kRq5H7pW/KrosW19ebDfJrL/W61fITzThYyniG7J8yTHY
	JJr39eHezXur/mn0nsvf0GlrHHA8qFfu9V4OWeO9PLigPiPvWzweQQFI6ckuwHTSMAGHNti5P+t
	KfVdP9eUiLdxwPvkGdgcZ97t4iArPcoOiy
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508469eec.22.1793190925170;
        Wed, 28 Oct 2026 05:35:25 -0700 (PDT)
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508431eec.22.1793190924561;
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/4] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Wed, 28 Oct 2026 20:34:47 +0800
Message-ID: <20261028123448.510401-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gmgMerGnipijRUvn312WnLo2uQY5XW3p
X-Proofpoint-ORIG-GUID: gmgMerGnipijRUvn312WnLo2uQY5XW3p
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1ec0e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oUwo9orgbciHMXp9giMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX/jEdmxCB2zgk
 VsJraeYmALf9z8wtNApc1QpXNbZng/tRcgHXDXojUntvLVS2rNuDyhyncKFF0w/sgI+n9J222he
 OgKsK2Psza+7uXZrdK1YqwyKpB3WFAv7tKC/3FaQty63HdlamNT+a+qLJTv/WcviFHW2bK3mNfV
 dl1wm+bHBpdKEAKybjWT/VWjkXjmcyt0ieL/Mkm1XPxnAnuAG8sNF2nyPDuXhhE4NTzYi8eBDw/
 mjlaajljHCcryN8UF0rNG7ibbnuQg9xfMfMJdeIWM6JxohiIrQ0pe9j9y49P22DczYXOoj4/2jQ
 gh/NP98nOfPWQTDkT2e5gQJ9bEkgEyFC7bCU/Of3UOO5N6gSMfmW/1VBMpZdaTExhu14Ux/Tu3U
 IUaV07Z67JJtaqVA7A5Rakfqqwx0VKgq+nUJRMl87QAU0L2qVX+551wgPptXhJPtb+IHEzFelCO
 L5Vjl9mtWbJxnR+Xcgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX9e4DkmRWE+/T
 7gDzj3BIvspS8NdlUE0i2kfJBPH0U2bu426HTM/6JMMjPoNkKkLA064/0D4MAmwpFHD0S7Z+Eqy
 n30l1kDOqisXCzPBPyqTKIcmsWVj3as=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280050

A consumer that requests a shared line with GPIOD_ASIS never calls
direction_output(), so def_val keeps its initial value of 0. If the
line was left high, for instance by the bootloader, a later
gpiod_set_value(0) from that consumer matches def_val and the proxy
treats it as withdrawing a vote it never cast. It returns success
without writing the hardware, and the line stays high.

The consumer has no way to tell. Its request to drive the line low is
silently ignored until it first votes for high and then withdraws
that vote.

When the requested value is the default and no votes are
outstanding, write it to the hardware instead of returning early.
With votes outstanding the request remains a no-op, as the line must
stay at the voted value.

Do this for all lines, not only GPIOD_ASIS ones. A line configured via
direction_output() can be left at the non-default value as well: when
a proxy releases the line and restoring the default fails, its vote is
dropped regardless, leaving votecnt at 0 with the line at the voted
value. The write lets any remaining user bring it back to the default.
In the common case it is a redundant write of the value the line
already has, and it only happens when a proxy that has not voted sets
the default.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 4eae3c9a5168..75d0d617941f 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -85,9 +85,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 	}
 
 	/* Desired value is the default. */
-	if (!proxy->voted_change)
-		/* We didn't vote for change previously, nothing to do. */
+	if (!proxy->voted_change) {
+		/*
+		 * With no votes outstanding the line should be at the
+		 * default, but a GPIOD_ASIS line may have been left at the
+		 * opposite value. Drive it there.
+		 */
+		if (!shared_desc->votecnt)
+			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		goto out;
+	}
 
 	/* We previously voted for change. */
 	if (shared_desc->votecnt == 1) {
-- 
2.43.0

