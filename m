Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584834;
	b=D0v7JcAyY74rCYaSFO/SnG7LS7XMIgBxAkw7vLQd3ftLNmlEgdbHxrlcosY2tRDGsfgg
	 Lv4HXcbi/OegV4h5LCUsOxHFce9PgQC4C+0LmxulAVm5FiDdPiG8S9Goa9GkIMEx2xNvQ
	 YJ+7foaVYEUZe2xxjyOWy+kIyxmx13ruWVct9eAUs+GRD7dvfjLtP3MVUfUez3JF+d7rK
	 eHPhJ1pRRPs9nP2UvxHpuGNC+T1GaqU5GYifB/mS4H92SEQn85TyhQkoybx2ND0sHAJ1e
	 PdfaOlngMdHh+9f/LDIazinTQ8QRG31wecKKkh1S84KR1hSmnlZuph2gBU2icsAPDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
	b=WGEsr2BSiJLRAI1A9koVgsDkLaMDyPTnw83Oh6WLOJTPIkpOjMX4fLYiUqGT70ab3WVW
	 WEpxFk1vXEmL+/9P3B4wHyXUm/5HyUARNwi+1GVoi/Qa6x84XRj3+OQQqTrg4okLkMZaO
	 TR/tONPsPjb+spN8FNvLLWoRKaW3Lpt21bCXKyo2Rb3gfLIE1FP0Hh5kl2DMsyF/5A0Jg
	 A6pMmJ1zT5YVWYAlT1HBKdrplr6M+LcoEeU4u0V4cb9IW4x8IJWgoZ6IAAZmZ3icfKKBI
	 qfqeC9oD34SYcyE+GAeUluIVZWpddX7DMteIReDsKdE536wGO8Qcuvrz7xg3ym5wbAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FD2606A880
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FD2606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fERmXGWD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR2F31076130
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=; b=FeHmIXaBYieL6OxG
	t6WUzojIA0ZKYBDTI8hL2F5VD7PdZyQVhoF8QNKqrS4mA4n6iJaAoIlvnhonIEDA
	Lm+z6C80W/reB6J2KTaV9ql5SlXhPCIx0S/e1r30MiTWPHpbPPeAOveG50n09PLP
	RuEIPw3JoY4Snyp2Ot0CQeamBYdrL/vpaJhgvLr7vb1zRDmqN3+qLw5Qv2PHPH1t
	yxSb3kAX74B/PyMVEmo+5VPpHHmddiEpPW9fk8EJXJL1zCoVNbtxdD9EsGtunU6W
	u3bby84HVmXrzZcBZKmoCOZT82WZuuh5ycecA34oL+5vjPSErYRuu7pShRxq4WKK
	h4OyaA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:47:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99089f9591aso161082241.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584829; x=1795189629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=fERmXGWDKC0DFc7eNl9p5nCD6MopVh5rz2Ybo37Tqlpo+aADJJOZv/f75BAZXxEWD9
         Ic/NY6NZhPDOS7h/eth5157Gqjpuxvexwa65cTrq33NLECDW/Tuf6TMC7x5rdqr1R/A6
         WuGxWPpE3IXnfP04pTEouMJUD3Jdh7aKuBy45zCVPr0bAFstXwVJ4Iuj59Q4kE8e+nuV
         Exht0CXXnyybMB9MFskXBGWVFZV53Kk2yQbB4rvEgflh0P3CS+a+pv/zc94KkPPuAuwp
         WNHRgCa/DtDFZEnZ1iU5XuNsV/5oSCJb24YbqJUZoMyvSvtNDG9CnPX/hKz2XcmGpdqT
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584829; x=1795189629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=QVycZMG1vWzNs0JZGPMOaGRyAWxCudKoXWb6IO0C5PDVUpncGNDF8lf9hOvXlI1wpO
         sqjhjcodPo/qgi7sb1aWzRUsrAn5F9PkNWSJLSW4OTDSuuCAS7jLBdvRkI4t5Hym+5Xb
         oW+yzRy/55F8NzdgdYkx7qXBgQu5UVc77LWt7Ln9qA9f6S44dSH0y3h1mIPdaSP1hdq9
         IdvKxtk49N9mumtBwtopboSzJy1QU0ukU9dj4tv62wWpmttrobyiT8Jxr6Fks4Fk2pzO
         hBkrUCX7+MtBPy/qPTLor6aQ4GTKN8ymEgw7wXWIM3xZCzMyv0jatl96GzOOHh0Uc2Id
         0LwQ==
X-Forwarded-Encrypted: i=1; AL+hErEsbFiX6xuCqj5quotkDh6H52I1tAJQS+1EMtdMQkwYKWeaUX1IXLgTut4cwXC1dd2q8M9PDkfmRyQG@vger.kernel.org
X-Gm-Message-State: APuU4Z/eY7bhaY+Ie3jgqjPIdQoPO0SQ8PTAu/brUKEfTgnegYJvvr/8
	E0KQ+0AtIminGlsFD3c0fZi1+a69HIi3az4PT6KL56HhBgBYDzxAEINA2UmZbmMjupEw7VirSxW
	EQblM127GCl/HvSA2BfBJ937dEAI1ZjbCjDuEtDN7/QRYtHx1BYV3hLRT5YZl9NT5zONvYbRJ
X-Gm-Gg: AYBFou22tj0q4n2un7ueQyx4J3eXJ1QTYMDzD9ltH2QFUQHBt+93XF+aFXt9AKNmibT
	9jIlGwYnGNWWiUcTRwdrxYDnWGMlvSyD4TkZc4HEEc8apLnlAhMUmL44qpwArTvdzFbh51uj2pa
	z2QSdXH6QtsytCTt80uvgQLOtw+prHFmkBRi9lehTZ9+KiMgKQ+KMukcgeYFDZnR85TfhxhhipO
	oTH+PyVqzLAJ2QHzv+ENtfRXP8EwmkJOww/PuML+cKrDsjiKaYWqe1hUm5VzVEB1L5couPmkQl5
	xysBBozevRA3eh9Lr61LcUVvHzy+gwisyehBfHJjK5ozy6bG+y2T1XyQalMYigVO7v1Pje/u8me
	R/Ux833wYnoq0+6N6eI/y265kI6DsO4aajvRq5XpU3vcfBfqLEKaDWX3u9kP7YNUKRd0BYaIgFo
	lc8Q==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691235137.37.1794584829240;
        Fri, 13 Nov 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691221137.37.1794584828711;
        Fri, 13 Nov 2026 07:47:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:01 +0100
Subject: [PATCH v2 01/10] lib: string_helpers: export and rename struct
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
Message-Id: <20261113-fwnode-for-each-prop-v2-1-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m4NpZDP9wCk6X2lLRZntvYOO4JCGmA1kZu5D+y8yR/o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD34fNGOw3Us6Spsa8wQXUoWktbw9LNMm6id
 xSi/+Q9T62JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w4MUEACv2DIA4WBHencGWJ8xeH2XgSLKF7rWa1HACKBslDnGDYzgFtvP+WP0BINXGHsfU9nEWv2
 R0Zm5zbET8Gud9t2ocSRdp2QCz5PYjYlIyW0exI9eU6MQkoyCiNwN3PqBtAAeuQYsozHdBLGZiM
 DJXl8D2TQ4ZCFALyp4kaXFiFCY9CsM2DBK2FYee8jDAlx6slky2/X1htkINXkjpJhfpzrm5UIm5
 Hxzp1Wqr1jMO4g8ioJSpMqufUAeeyY/lFruejpTFY/HZtzc2jGoCVUMN4qf8hbuRGux+Q4GjO2/
 7E5wjbT/k1oSyCFHIYLZnNjdqSJ6xD7X2GOB1rE87UEqPdNY+si1LIjCgKT6WMTwJv6kP23Qnne
 2hLkvRYovnawknJkWeuffSgA+ZqI+FIYin9iG6P4ik7sHTUjsrIeNNmnbgELRdTbXQ5GmsAPDuc
 ROpFolb5danon5vtph7Z5zqjvc4ZJ27Qbifn0GTweLFQtiUDImuojNNiDaXTLLRcbQe6I5SAoNa
 gCSF69hau+bYvtD+vgR9qZVpo51TFSpCKyJYNJ8FYD++1VQGvW2v2yL4nFR822R8NOD3n1hjFtg
 cUZPDoLO6nxfU60mWZJvYgLDArvSgi8rkk/yu38ZYS5DdSNmCxcM/Fq7jv7wMlHdm5w0uTqK4Zv
 Cn/CsMAdImuO2kg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX7iFuP9IrKN4R
 JYWWlv7uLxBtv1vGWIT3gu1zGwEewp4goXar5FdasiaG/3kon2y0nK8vc0PFsa9WGmt/XlRUszN
 x8nUQc9ju9Pl1Fnap8mV82ud72+OVAA=
X-Proofpoint-GUID: w7JWr2oASNifbfoVPT48WHngQ-lbdy8V
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af73101 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX79RAJ6zhglDd
 KcpUmKuv4l54gTRDAW3QiJ8HZ/0e3V5l5Nhf0qAwmEZYRWgtd7T8v9XbMzEYJMOdPrOHP1979jB
 A8uwHWZw2HMCK9vvHe6t+hSwcEcsk1v3oXww8oLZktLhzo6m7rUaGf1uixUMe38Zr/GVjuAtH6j
 +44ce2DEHEPOWxxLq+6Z0MPle8BCm957k7bC6etR6TEANZwEYenY6PA9vdJ1OphjqQfeyKSZXKR
 jyKsU0AbbukcsYWLHq6YA42/MAP8dZS62dvFQHOUIVEMHpDeAQmRsceLrByFjY3nUAV6foBmR3l
 5187v78Cd5OWcmNyahVbcL4c8TGhhr4t+tZShi4kg3QFSJ/T318YpfNYCWAjIHMbYj4khwXNvvf
 kYPsWlxGll5rZFD42avXw+GY4JroQjQ95uD/KURh7/rd5KiM2cSQhTZch5u4f6IIMTd/dyx2wMN
 aXxdUDQw04B7v9YOVYg==
X-Proofpoint-ORIG-GUID: w7JWr2oASNifbfoVPT48WHngQ-lbdy8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

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

