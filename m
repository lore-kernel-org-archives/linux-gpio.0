Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDE4FC33A
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896598; cv=none; b=hDZwwku5bbwmKnVvgUrE8f3fBimF3jZtFhrKwoq7hXNJKfrx5u1VhLH3MQHmvat8I3lF1xrkkeSnA6ryQJr/OQvTnt/paMlmx7r6mFxrMXBf3k0BNM//lT7fHtvD8mkZAa9ZIz18TbPIC6gA0FSIcq9/RfhQlTlj2Fubv1rojBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896598; c=relaxed/simple;
	bh=xdaguOLdGcP82nbrEvbocKZ5hikmJBkmPYWY95xsSr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QHfKnpJN9iOk4rvhebFJggBY569CYF7x5xw8VJk5+/86Ds3FGD1l9DUZRQpXlLcHnMbzm3bWxh3MDje4f+uuo/FpDP9XL9jL1rDE/smwvWHUw0phvNLQMgH0q6iON/9oYvmESxzLCsHkfg0i58bVfPmgUjL9EL2z3shwIHInLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWLRXztv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYnFdrOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWLRXztv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYnFdrOD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9ZLb43476315
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DTvAWw8WDAU6M+LoNCax0
	5+1Ze0jdZwXofubnzIlBo=; b=fWLRXztv3n3OFnTT9S9o9D5AmdAcKWN55yYsiy
	7AJtxns1/0u9FTMdJLar1EsinZt4JC81isa+TYHVVzapOo9m9iMxP369mt66uwp2
	rCldItS8UfZPGfgX7b+A4cNyB7E4u43A8cFYI5NZgiYlKrVls7eZuv9oirQAbPfj
	zFvnRejEJQz5oGynLmRK9TSCQSYdWQNgBZnY9EsdTOIG3jdtk1LXCfq/jTlWNTL0
	5W8DvPneIjBn0kIQs/AkbToOuB4OETmq20u0xB81oxb1trVhdfxkEnhk0b13QECC
	aLnwocXj/Us4jM3FLyZnXPGFlOrmODCMPvU6SDZkP4ZA9UJA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7ja5k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:03:16 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c660a704aso119545241.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896595; x=1792501395; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2DTvAWw8WDAU6M+LoNCax05+1Ze0jdZwXofubnzIlBo=;
        b=AYnFdrODHHFzSjDskU6m3c97/ZxIzqHbRx5boDY8DnY6fi0LvOpi8OuPVif1Ky0+nl
         7QlWpZS4jhEiu4of1LkrHnXBv7fLEeudAoHlrPUWVnFv6mJf9X2tl5cBpQoo5cUeUszC
         4ebQyU2LEuiW/Mf7oahZahUNxipmvH7IR8rJeMTb0yPRcXsOoBGx4AhCZ6G6nq2DI67E
         M42K3nB4HAqHQ9Rf38FPzPtGNgJ0N2s8MnYYmymLwXlwL4dhuBjHFX4otNGb6oGMXZTN
         jrEQ8VVy9hAoeZe4Pr4ksB5c3aPEqAql2HODL72kEvJ/bmh+Kj+BqexhWl7ULm0Z64Et
         r06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896595; x=1792501395;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DTvAWw8WDAU6M+LoNCax05+1Ze0jdZwXofubnzIlBo=;
        b=BbykE3K8Xx/e8ad3HUzYBTopkG1fXrqV+D/0liL7DVv98Q2tP5fhCZTizx5FVjR1DI
         xU+UxNwIWSZArsarX+ukWJYRBWXcAagqC5ZWc7gdvR/qYTk2tp4rOwbskzd0Wla5CnlQ
         er0LsbX+dq2aoA0m9+b9bahd8Y68CPOnbY9OnhQF+haeuIhVST4tlmR9ZC0EJQRbLSEo
         kcCx5gBHHK2eU8qsrDCHmqrhsPGQg9y+0GgcFrkfazxXy8LP/o2IfnuVMdEzwtZtnbUw
         13oh7Lu2ESnwsYmuiiQwFogZTaUttQYy/tSXIFDxangNeCQ/7Cp12K7J09GS21GdzK1M
         9Bgw==
X-Gm-Message-State: AFq9FYJ20vLDb11jVN4OGg1vlJIsPy/cANFQ5eJZV8yDVC5rAeCUs8Wu
	SIkiv48exxCSzFLX7VoqRA2G1bS/kbEQgVDg5yOitr/9tVs0snwO8aYxiWzTKMm0iyb2OvOhBas
	7FKgHcuRvFoBcl2EV8xWV31Gf/zpnUUeDGB5fIicmgKi9NHUAAfkfoCdfXMKc/Hc+
X-Gm-Gg: AYBFou38ZLV9faXIGM4wuCCH3O6xi/ojG1h6XfOUUaQx55fbBUGAWj5ghcp9cPZiWxt
	FSIQxsDx4dcFfRCHLI8h6gSiW24maCUyH4+ZWPCM4tBWRFIWd9z+nFddEl50jfCoLA+GXXe0i7X
	I9y3y0EVYS7Seiceyk87PcmoHfhYtEzeMXZFRefvWkGHGxOLyQ42eZE8rLcobWCirwCOFPuOT+j
	WaYTU43H7mFlvaUU6/QFUW3I4f53iaqVDXoSuw39jaMfdMHsQ89sIw8lgH601oagxyCzLmWwzYD
	i6syr0RH0PLWzHLnyuPxFydBBpeNmh48urTZvZB3JWLCOBxiXNBVQWKZhmleGyXww7ANJjYZkam
	6EdqKmykJrhVTX6+aIyRuGMw06QtM
X-Received: by 2002:a05:6122:d1c:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5e91f43e0f0mr4115184e0c.8.1791896594983;
        Tue, 13 Oct 2026 06:03:14 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5e91f43e0f0mr4115096e0c.8.1791896593004;
        Tue, 13 Oct 2026 06:03:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] gpio: kunit: add test cases for platform lookup
 tables
Date: Tue, 13 Oct 2026 15:02:59 +0200
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMszmoC/4XNSw6CMBCA4auQri3pW3DlPYyLQgs0PFpbaDSEu
 1tYudC4meSfZL5ZQdDe6AAu2Qq8jiYYO6WgpwzUnZxaDY1KDQgiAiOEYeuMhf0ymRm6Qc5wsLZ
 fHBSMMl6etRBNAdKx87oxzwO+3VN3JszWv44/Ee/bv2TEEEFEq0YWrOZK4asNIX8scqjtOOZpg
 F2O5EPD5KdGksY5rZASjImq/KJt2/YG0XY+sREBAAA=
X-Change-ID: 20261001-gpio-kunit-plat-lookup-6434597e66f8
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xdaguOLdGcP82nbrEvbocKZ5hikmJBkmPYWY95xsSr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwGi7N+UFDKFYZI4SQoCwIwwK/57jgkA5b0M
 UsI+TvE4pqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sBgAKCRAFnS7L/zaE
 w3nSD/9LQlJ7mryqkjufKgCQEgOzMu0fpN0+goP3WWNLwCshdzeaqvYIi4CU/pkDGsj8E+/XYfA
 Grt+LOIm0jbPP14Zm5Ju9Az5B8h3PGfVs5VfF8R1f57qzd19hdHbKJKQ0aB/ohyg+VJ2XYFmeiI
 RLiqy4UQCcG15ZTUbS4FwiPZUctCAJgrghKSJvvN8eyY3CpK9ZEIj3BG3jPp9dsRQV2NCwDRZmi
 7f8huvm3q76OFHNndZeJklF4dq7EyPXqB3GbVozUS63serQDMnOgU/78bj6gSXWDEy1/9gtVVP7
 2TBbcXBcJNun6Dn0busohCi2VixpaQ2tumCB//HzkQNwhtwrsedzxR3N7+e/WUIKxEtH93+dsXP
 NW9Wluf+8UiKAnbv0E3hA4sNTSc7umBEiFNn3qE7Dcj+b6Z16xr57H6FVvEq6wxe8AgBuGtGdg5
 3w9jDH+sYf1mqFxA54mY5nvh/IrG1MV9TnW1lTCsKQK/W+wr33RWuTbYYsdf5BknvpPHYQcqG/N
 OVAOArs8gV7SSRajoxMCfrJSzZauF3h0DXlvkiD5q8E7VYE7Wi74jAgVtP9Tb5Wp/1CoaTpECeh
 J5htkdhZ8LaaMGAnGm4CjY200NQaojMU9imZxhXvemHMLvQp24P+BtO4vXo+KhdyLwOK/6AwlgA
 ErVUAT3HVyr6jlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ukHWrfgdrg9eroFevWfWXCfJOu46SGme
X-Proofpoint-ORIG-GUID: ukHWrfgdrg9eroFevWfWXCfJOu46SGme
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX2IuWCS0TYhC3
 UnWTS+YtKMByCjo6pz0hlseFzLA0dbFiqwhxjMHAQ8JxajtQ7YyzIFAcSaHP7NgkBOWpiDq4h6c
 Ihmm4uGkLTbnSJlS6hUrGMGrjm7OZag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfXwLkmqW2pq+DX
 GQTC40ij1UNNGielEc88em+C/Fjtx3ovhMlS9tjwZ+SK08S3jvIj8J50rucOoZikrFtgRyDQGFW
 OA599Ob3tYhrmttdHtKBLUt3Gu67jlkmDVioNrOKX2YLz9nn0q0A8ykzWG2qJ/vmWsQg5r4cITZ
 pFgg0f2mYX/qWYjBEMw6tbwXY3SoxW7T0+P4jPzjJl/QHueyx+tDrTlKQ25t0g3HZigE9uXka+8
 bWgq1fUljSXyMimxCQdpZnkdVJh4b9CDZZlYHcDEIKxsKOovrUGXFimWdFC3N+QQxhWNPyMcaUD
 o+PCWJlRlMzQJbuvja5hubnGRAXaFwvUd15YUI8ufTxzJH1zVIt0H5TW8mKboTXxP92ddnweLEL
 UOeeICYOozpWljg/tkgC2W9lI5BqG4BDXhPCkR5OymT8qaEDVjsTuS7dVxm6Lnn/bEoTh03Qjgn
 jcI1504c8aNXZ7JPtsQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace2c14 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=q56TT9YAK2MK9SgkvIAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130051

Add test cases for platform machine lookup for GPIOs along with some
minor refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Add missing call to gpio_test_device_check_bound() to
  gpio_lookup_table_global()
- Link to v2: https://patch.msgid.link/20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com

Changes in v2:
- Drop unused variable from new test case
- Drop no longer unused define
- Fix one leftover variable renaming
- Pass correct flag to gpiod_get_index()
- Link to v1: https://patch.msgid.link/20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: kunit: fix the label of the dummy GPIO chip
      gpio: kunit: factor out common code for waiting for device probe
      gpio: kunit: rename the swnode consumer to a more generic test consumer
      gpio: kunit: add a test case for platform lookup tables

 drivers/gpio/gpiolib-kunit.c | 235 ++++++++++++++++++++++++++++---------------
 1 file changed, 154 insertions(+), 81 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261001-gpio-kunit-plat-lookup-6434597e66f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

