Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178816;
	b=IQKPP/skEODmbBn1apr39A4WNC4N9eTJ3RKwiEbXrIvO8ix1zOKQkIVCec6yXD3DRvr7
	 PHsmLvLSAzxnF7quxVEqwuNnll1BXgFhFEpedJJg562pzu/hzde3c/GbHS/fBCvT4UB5z
	 eY4ou9HWE7eHUD4bz6ouTS23Z89+Vbmehuza482TB9UE0CvtAoSLW43wWM16N8uaQ6ZcV
	 5jx7Ao7GsNFNwPzXr9O5zhuO8lr39mQbEtgccGyvywIFhqevrDRR9CtgqKLWioCk13kef
	 0Sa9wAek9K1YNoUM8RPtDbNPezf43Xw/bqHXzapdJrNkM+pBCYSU4cQMj6/z5rndygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
	b=XfsKra7KZ3cSubx1z+4Grg2p/1bs7VFysUd217Nvasd5qH8dRle716SsUC8G89rEC/U7
	 ObhTt+9+6YRLgZprX6u4XFPqVkHYoAepHRkqvya21pJk+l/ZZfxwxuIgtKhlYACxg/pfB
	 HZhoN2egtCx8szCQqGqe2OpODyVocO7cZfn754T/81eMb6qrZn2GtuVCJtpbu76TIk3rs
	 d8ACFp6QNePYNIxvTiNU+wteeZbMRY8jz6NTCNPMCYqYf1dSZLoQeZeRKR8YgmvEkP7Er
	 Dc/SpF3orijhLYI8In0G/cMpVDSVHno1944mXlmh8xMMKDUWznDpI9NDoG5F3lWrL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSzLGaS0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1D606A33E
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F1D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0QGU5oF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSzLGaS0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtqX1528517
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=; b=R0QGU5oFbZc24jaz
	K8JeAKp+DafQwKeQBoxLJHy9NZenThm3sYRNunrFmfHhNflJkG57Pc06Y0tXT3KB
	SqZxq+4s300d9D/djek7paTjIddyIBOvH+j4ldJnws3F0Dk0fC2OTq2fJ3CHsSHH
	BS2PivKuvPe/co8DBU0MghGe5/XjX6WZ0YFBb15T2mw2TWvuFKIsRZDZRYSMG8TN
	Q1tcme8/mDF6IGuHndSuVJaleqI2nkQ0ZWOmi4EzT9KR6kQcogvd9WhIS3t/KNWC
	YT7U6d4J6Aa6JrrGb1U/Pr4Hgk/duzmLevKcsBkat4fZdSNAoaYDya0g5kKZIXtn
	iXQTMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:46:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so103496285a.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178814; x=1795783614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=iSzLGaS0fMC2twSJZ6CHEvYwjXiIf0FMXWhLNiLgJ8Tbk+te1FE7nMPlqoZA0+zrFc
         Z0mMLMFfxF4W/FvqfOdar9BJPTyOK6/Ek3Wx/oSWHiIzWz3Arkd4E4xcm7jIcvhFH7VL
         L14v82dZ7Ag34vyMugl4pDsM+WvxUXeGFBLf3biCXkpXEq0U8pIOUYKv/6MdbA1OA1vY
         sMw9Qo1pJbp5f1xIxwA2JkUjG9DL+vfcBFKqUiEuWMO5cHx04PaFg/AGZnAwIGMAbjFn
         Z79U0Pm+NSpB3NMYHOYkeggFCm9O/d7c/BfP9WTSGDW4PVq9aJdCa82w2YqLOglqKbwc
         U0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178814; x=1795783614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=Uggzut1NTiJT0kYHKTUfBFxe04piT2xBWVt/kRd6TfLOvl7IEiSmxGymKOhd3nsdfL
         qZeLhnKiV2k9Qir4cD+ehMXytLl7AVwjJSGfKywR1DKhxQtJi7IjUW5eF+3FKQCt64aT
         1In48Nc/jNziVmVbdfjMSPuAt20niLrJU4NpBCUiUUhMHvGQs3KcN1thANdhFbGzTWKA
         kMLVUzGHbaZrRu5AOBDUP/w7es/9fD4ZbnIiQYNtOZy2czN8bFN85hCd0rSt3zcDHUMZ
         80aQsit6e+V6Hj8D1KN+Z2V4tYQWJS0kN3ZK6jFQJL0FO94mVuIB72ys6TUGfwrpu2ld
         QAEA==
X-Forwarded-Encrypted: i=1; AL+hErGIOoEm8nrNRJ2VnIrQ8BWGAccSqJI54HkN2q5vnnZ08qj29nAmaTNu46EbRvKyeNN6XldZQNUXmhzw@vger.kernel.org
X-Gm-Message-State: APuU4Z9j+ePzR9e9i6WpmRsssXpePyFA+HLRMIETP9m8dOdd88dMfsFr
	o5E1lQqPbfUPFSla/PfoaTPzawIzgKlUeD88wu095q/gmVQLYhefbbpzyFPjplmnoiagTO9f8/b
	MCFv+Uhv1ydzC+nTjYke2068miInINF+7uFHOwlXHMMnEH6MzJ6pw/SyK1ramrRpk
X-Gm-Gg: AYBFou3zFYqEp+aauBPcXd+P0ogt7BlCwU4xEAHhLRk/pPfYhw8APUfzNZrsUaL2fhi
	/rXkMzf9t+BfzW5JMZqGeWJNJkr1GewolYpN9Aj3TTeT8TTdW/2bKsgUPa+axqRz+NtuzlCvkXx
	ow51Lj0BVfC7kdwTV39io3+uMOIN546y+rYElFNCIJChqWBy8USwVCKn3TWJNM8feWmvCkvc40K
	sGcSXGAcTygb5Ya9+7z/QdA4DgKZgT+bbMrb/7r0iBQUZhzLtCbZR4XY04hvZvNakX5qMQA4pC6
	Eas8fsd/ZJDCCoc1o8R6WfqyHMeJgfS3yL9EYc/Rur1H4WIAZDyAhruUK4p3AT9wzh+6hBAeYLQ
	r/RtqszDz0O6Y3ZCtduavkpJS2GRvM51nqMe/hezWxAdQxkIsrU4V9Ja9y/HM3B/kRw/5E0tf+b
	Q=
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519730885a.23.1795178813985;
        Fri, 20 Nov 2026 04:46:53 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr519726085a.23.1795178813505;
        Fri, 20 Nov 2026 04:46:53 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:38 +0100
Subject: [PATCH v3 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261120-fwnode-for-each-prop-v3-1-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hYScHpsRvvGBrMd1w71TLaQh4T+I7gIpjdQzKJBQdf0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE29BUzYu7qXthMo1ziHpRFzdZUEh3WqC84F
 OGuKrX0zbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w34sD/9INMXQs1L2Mvsqvlku0UNIaFhS95oY+fgGh50hV8uPpZqYJ9NtZmpgskw0vpYis2Ro36u
 cztRSspCvn/1Jy3tnFXLHIbVPKIidV7uL/eo+pgDu2WooSCrpLxyVtDrCNZnyQY4rzglxSzgFmV
 20FtfdT647KzE+j63r3q2iadFYnTGomwGclZCfdpr3nExBli6ufhptbHBx2Q47EUvuQUGzvAV7k
 vyt4OFpD9PqxpFfoyXpBqT1Pgs9d8guOTsWXkbluTz0VOLA0sNtoMilnS0MvpxAe5azhLzRFSS7
 qrgJL5Vki0qb8jbx6YgCBxzPIf7Kmu6tQtg2hfjYCFsPj32pKplN7th3AJk8sj9qpLQIjomLZvw
 ZpTl8iJgw2H+oh6esb977jX6S5IxI7IiNqfg2zbHb308qdGmD7tw8z15idvvEDvyKO75tJHJ/79
 wkxPro8xFGpTImnweShdNOz9gkOVNue3adn56GhyY1nrWX3KyRYSzUskSGUEkAuFxpZkOAcMYWe
 SDGKXMcobp9/+IK83ILgxdB8ShLGcthKK1mx4mcAtYwMmbI3VBlmq2qBPyDJ8N6EyXkSnaNYB0i
 po/BVd4HrzPDYz4cPMbC/f4Ix9nHwFiCRJAYTkd89W28TI1EEtyp6D2bWlP3PDqIyCppC7jgWh/
 mWyRS+q1a+CyOKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oKT3NrMk75w8mejTF6pLlz7In4gmQ305
X-Proofpoint-GUID: oKT3NrMk75w8mejTF6pLlz7In4gmQ305
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX1yTcHdXDQMWh
 JCm4dvjocBSUHBDFAO5T6w05JsPfxtu3ZwCwM0E2sp/ee/LDhrL4nJs/ZaLOkTvAuuPipPShrri
 zCoo49KKAgj3KKTb4A5H5ZQkNVbrQzFGkp28Vep1a9IZPkArWpOxuMm9WNpSNdmOar4eAgPcAoJ
 QVos7GvuQ5BrMpguHbKH1eihWB3PPMatiRCeH+xTvxkosPshgqPyZQycyUOdz0syGtv0Z+iHnAp
 MMLrpzgfcAUlLqvy5Uj24puTLAN3u6fXGqDkK2Dm7A7JmoxRsmhjDzp07iu3gP3evde3Tu97fQe
 m7a+rXJaSM5jWizN7HARsimSudRpzuGSflYOoyyYqC3gZcnJPjOF+XuAy0kVvYdnksO34oLOMij
 SDsRF7MDTJTX2J1UtQfXanlC7/fv7fG3LljPfBKugoJsvg0sutzNV0uMmgDSDDGP0OPqbhCfRhe
 9LxxoeqMS7rYm+qkvLw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b00413e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXxLv+mLHUc3EN
 lVcV0WMpkSOk79cQI/RD6RaQbJmkdHVdBdjLVLrupXvBnFvkYRKmaE6Os5mUl++EL6jF7sxHAi6
 blWSG2I6tCRdX0JoNvP4sBQr94ZGOVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

