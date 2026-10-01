Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266739E176
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865133; cv=none; b=EbJDw3h4e4Y9AHHjW/0YOIa2iVOOOq7uy9jE94N8SYzuK27WhmH88lpisaOsNsKtdeUL2WSIpgtlpr1kWGskHFqEoKDkvtuQ9xyXXgEyJmXHL/J1uRQZMJjqVFte4WyfC9Pi+OlMoKG61pRlJ9KcJodipg1RDQgH4qrr7R5e0UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865133; c=relaxed/simple;
	bh=kRZADiqOjZe5jz2s8az1r/M8biZ0eRMbfERIE8Zhl4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pOBxrk2IyqVUh0ETsJSCNr/TRKbbhRWsQVCPluDrYze4xTmts/2xIAAnVKdlFxPckQKI/fzhlTeXPG9/pAu9T0jYElu/yCqf/9zmztzKaXR5tevztBJVgrNLvRGnQy10QGTRwpVqEs/6a7+lcyd2DdBrLBd8Xe9tYdmU47SKyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhYng8Ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4A/zP5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhYng8Ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4A/zP5q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHiq2825511
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1cmaL9RGb6jD84LGYkf1L3
	vwyba0iTkgMU5Bz7Gb9/g=; b=ZhYng8Ue/hnySrrybKaRbUlVIeX/lfplDF87hn
	DLNVHFHWKWMMRFoMpBBUcYfHHHrj9sxumVbgSdMfRPZLr2Vmg6e8dA7NW4AQB0Z7
	eg4AivQR+AplCRMN3a0vyZXQy9D2unBtQD37yGwLjVSLFLlI4FaWrLNP95Fq8cdo
	SJS9FjTyzKaqjQENYFEcPJlswW9gZy0fiwyRGHb/Hl8zjcMy59kxPJcLFq3JSiNi
	HRgS+IZLwGRfwWVGkOJcfOknxGacY3piCleZd8ZFDyv+x1bpd3WM/7lnUdHbaOPK
	2khcryD7baiUS9rDXPkGKYW+dRDLxsy5EjZ5pWsPa3u0TlvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcft0ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7be82ccd157so325941137.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865122; x=1791469922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1cmaL9RGb6jD84LGYkf1L3vwyba0iTkgMU5Bz7Gb9/g=;
        b=b4A/zP5qD3DjikCZbmPQufRqU0HzPnO44aHeYV4eKLO7GL0PHvO5pf8WNqCAXEsJp5
         yncuOuhbYJhKEISqs6xSvnWxLiNSa82o/+uvhJbmy0vzT0ku17Om5tvIxlsXdUwF/8Sk
         qqu4YmJFEmqY2JvpzFTKIeyoI2rEBh2f3eTOJY7h5NL9JipNnVFE9Y0V+mu29bPtvv2i
         Urq7bGFzcHXZHPUVNg4M2jRPWJt9U+/l99XdKCU8vPl+vP8hb8/moSnvAcidhPoiE+11
         VTVqvZduFPxqx04Gqs2w6cKrtsEPPA/7YunBasdU9rbQiscdLZnubvXx4Wty/JAfg0XU
         BnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865122; x=1791469922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1cmaL9RGb6jD84LGYkf1L3vwyba0iTkgMU5Bz7Gb9/g=;
        b=uyZ7GZWXPDJzEq3Z/D33Z6IASHbzILOKkwEDwalyQQSdRcv6uItGjo1xR/q4fXUNb+
         cVEqb23DcB6wqytPUzBz4csVfZuFF/AvKABNbkkz0/S47G0yyrUViCkAt/Ejhjr0oQch
         t2ojpTlpVR5Dk639y8G7JexzUjYN8kd3XQtKUUTJQPU2+g/esKes5reD1oV7ZH+aPu9I
         TWPbKw8d9Pohwm8WizDmpOj/W6gFdWcyoF1GcIwm17Gp2bZcORk4apwS1k7hFaMv5E57
         mo+17HvG6Yr2KNmjEgBiQqVXBKwfpIGZ+te/HKvkbrWr6FydNX24GCYjRnuUSs63pECP
         FvmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX8iiZdVvKNPkkiYGf6vVIbtISZe7y/YsVGgYEO/PYzr0S6m74x4dWU2cxi2cn4ORX8FJb8pI2MjPM@vger.kernel.org
X-Gm-Message-State: AFq9FYJZiU4FBcBoGC0+Ht08tdT8sG7Sgic28wlqPITyyByYGQHSX+sm
	CEfZ3l0TONTVlYVoYNTE4bJynoff6RbRvv1aPDcgee05bHteWvj+CW3Eu3VfHhh/bnFdHoiu+Nw
	r8Na6TA5RH7kzwsS4TeKnoqGOVTfNrT+n0Yf3/23M4rcfjdYaCW+R01xonggw8rOmUprA3Bbz
X-Gm-Gg: AYBFou2NwIoZUM5yjtkAqKvS0ORD2tfyURGI1I8Cx2f08VvhxOebsiyCAp/M9/FHSr/
	JA5uVsmhTpDH+A3gL1rAHMj6z06go8mH2yOIAIfB7LIZzalda+rlili6Dx3MgURdzEbCNstvcx5
	nqbuPUiAL520AJQo6TsGPbpR+4z5wSoqtkgUIIV0c74/sKRjAjiRyefjxGdWCwk2Uh1q8rP0BMh
	y1w/OibP+Mn7Y3l8y6Fjt+KnbMKB1u8u1lrUkoxH4giqR5HnqDU2WfrxrWXifJRA92Jscedwzdy
	n+mxynggLl0knc57kQtPyyQh9TMFIuHl5VSMgkkghQYgtQbzZTHs7D0Jmb5eAVGIWYk5/Ne+hTI
	Ged654d11WsF45eD1g0zmlfJMf2Q1
X-Received: by 2002:a05:6102:390d:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7be7359f0e7mr1235418137.25.1790865121745;
        Thu, 01 Oct 2026 07:32:01 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:7a1:f7d2:e839 with SMTP id ada2fe7eead31-7be7359f0e7mr1235404137.25.1790865121042;
        Thu, 01 Oct 2026 07:32:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Thu, 01 Oct 2026 16:31:46 +0200
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNuvmoC/42NQQ6CMBBFr0Jm7RDaCIIr7mFYFDrARGCwFdQQ7
 m7lBG5+8n7y39/Ak2PycI02cLSyZ5kC6FMETW+mjpBtYNCJzpJCF9jNLOh748hi+5rEEg4i92V
 GyrOsNVSntSUI+9lRy+/DfasC9+yf4j7H1ap+7T/WVWGC6cWm51wpS8qU4n38WMzQyDjGIaDa9
 /0LPU3kockAAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRZADiqOjZe5jz2s8az1r/M8biZ0eRMbfERIE8Zhl4g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7WzR8TNdsz4/x5bTcxAnGjJeX8r2EJb1C37
 moJ4UZ6e0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u1gAKCRAFnS7L/zaE
 w+gxEACWWij3wubrPtuVmGsXj2MrHEEEu3STfU3drE7ktHuAxqWU8bA6qMm4mNwT5d1mW+OYEej
 /vUxZwQ9GG+y9EEhQqX+Voxiur9klj9QC6cjcQN/lUHyCNzSOP4Y8QBy3O97CAKef0d1GGb0qbM
 Nif9GAkffxgouQWZkcYOY4gMO5cE541I34UMGrmZ+Nrk7xC5ycYlu3z9qAY9YIqoq1bz0fB1UEq
 V9DBZn50CCcCGkqxw4Xnk0vdCFRFjaTWzLSOxfaMnpqhR5b7PQHMRlP15Bo9sGAbVccspr2IDOd
 2Efl8lwAgjj0pF55ZIAPjgyx0yzxgNLvj18BXDD63Y6dT3zOx+y6uyJdRhV1k3uXZpb0BiLuN73
 dbXu7WyCBpqDbp3oCiLl2N2naJcbIlYHHNDvQg4dp8D2D1XdPMDPHccWjay36IRBN16x15PPOqt
 2A70qI9HQ2r3q+QAxZGcjm31HytGlKsardwYzyvl53eRjBYhbHEsUrzgRJkeEDxxm2HScfFHvCt
 p5nV80s5Ve/sZpbGAsp9XhLM+c2tO2Qn3nZM4zHKHy6bLPGDnkvnPDUsQgdwHGUu3glajHVsUWs
 FL3sIW3H1tC1dOPwrQGeHtCNwkZNAdRusWYYnZPHVx1QrjzNJtMnEdflCtxf/o7HpjJsOhxDODV
 qNb2wLRFRTaH82w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXwxAuCDBmdkbI
 swbEXhtP7QXcfACBaGl7zi8Y5HRzHV60OP7bUclkbdrj17cjaudoHA/rhAt/wzAOhx4KQkLNOn4
 Sd6U2ZaIfwFdb6GOB9lQdzA3gnzJ1Ro=
X-Proofpoint-GUID: WaDx1VdQUq8HQLBy1e5lzUWNpDCrZluR
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=0KPjAr2lXiOpQlSx2uQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: WaDx1VdQUq8HQLBy1e5lzUWNpDCrZluR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX+3nI+sBLA8cJ
 HPVoKHwDnEn5rEIZOw8vKTybqkJvo/y3HoHJCL9/5zVAd2IKoAflqsC45vMvrq5/Oq+yE2u9LOc
 XYiKPmnh+z2kac7hH5UZX/Mdo6gcf1QJMfjJjJRX81oYmBRGh+KxK9Et7U3u85L9tWiplC5VcfR
 3s6ZonyEluqYqV4o+Yvin8eAL1f2PtQ4C2xKLGib7G08BzVXvtdWC/WQ2WLUDQ9tCR1rDvGXPV7
 0fo2l3HJUssYIs7wYCfAyjWyiznwnY5yZyVvYfAl9PX24EGf0QAA7LGu+5xL4DkPwCcztyxTbCg
 sASB8OIe/YysapSwN8m0dgDuLFXKVj/bYWD3/csvAJuCrzP2mw+pmF2q3ecDH6Iu2M6plkhnvgV
 5UkFL8sli4TpeDyruINslyG1oDXvzkdSUtwZ5thOC8KJvJWvnMfmTGLqV4bTmdh0I1T74gviP4s
 DZ+VSFPoYj2BVbTMKWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. In fact: we trigger a NULL-pointer deference.

Making it work requires a more serious rework. This is what patch 4/4
does with 3/4 doing a non-functional renaming for clarity.

The second patch fixes the NULL-pointer dereference in favor of
gracefully returning an error. The first patch fixes another problem the
clanker found during review.

Tested that the issue no longer happens and that fwnode-based sharing of
GPIOs  works on Qualcomm Eliza.

Patches 1-2 should go into v7.3 and stable. Patches 3-4 are v7.4
material.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: shared: rename the aux device field in struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 118 ++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++---
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 64 insertions(+), 89 deletions(-)
---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

