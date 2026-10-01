Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05E9521886
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865135; cv=none; b=EPGvmJ8aQRAhkGB4qhx5gNUxzxxcm+YwvasOLQZnpGQGumQB1FqLZOx1tHIs7RwKUsJ55Y6scZ8ZRsz+Mp2yrWo5RTuMuwKtIVy04Bg9FeuStwnPffcTd+cxQrpPGD5BaS6Kxb4e02bhj9G5ZCdRzzIGj3XUhteWLOmouVephmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865135; c=relaxed/simple;
	bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfPL4IgXbCOhtYJYRS5sjnHMiBAjNPE+9UXc+wQnLV91yYbSBiMHX509qQ0yo1jcUrItIYn6gv9zdJMhDSXUbGosvoCsjBZSBb2cxhIL64DcdwFTKJclCrpXF/L9bqKMERH20jvN2Of4Kyx4wexTKhiMKnmbrD7azOGKkCYlUU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvrDABO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCI8XEDI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvrDABO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCI8XEDI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjIoV2403884
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=; b=FvrDABO+fys37/rW
	wMDcNM3X7CnW7ZhXHmgXUy/50YJxc0w6x8ekY+OlY7xEhPCpblfbh4N80GjcrxUG
	WWY3r7ox674e+6BPMfXI8HKe0rm22B+BpxANjl24jwXnROQLRKCYaGWTq4Y/scPH
	MoAJuzC9Nuaczkw23RkoQ6m9n9av3u1IVnzREeiO30/kB7uCU3/9DD1ZQJBlmuFs
	zFnEO5xQkGiyEKaMSshVtZPsZNR4/uiBW9IEqisjFfOJ3p6EAvDs0Y2um8s20HFm
	l5i7GLxc/hPzlC2XvP10KfWjCNG18xx5dJYHli1Hn3ImRE3Qypk1UXUsJRt64UHX
	eCrr8g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sv6g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:32:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf67e46ae0so299917137.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865124; x=1791469924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=BCI8XEDIIguWO/Hodns1qqt6jMlpAc3iTA9mWUYY85kegWM1UuPTNveU78ZWDTN4aa
         V0sZxHNHiz2C0kCthIAJgTPgTWDZqNejdWujAajxwPJAd5v3wIfWphmA72jj7xAG3qNc
         kKG0OG/bdp8moVvNYzPfr3fYdR1GJ9Zc1yXlj8607Z+n7b0gADipbtueodY9bYe5PVLe
         o+W5QRiLsViznqsSviSzbXUAja44Sa9ldCk94E/fPTTdCf6WhDYsvKFRP682zO6HBG/p
         W3ghfC2LBSH/8jbGmoafjo8bER8pQLGkDWMj7vl5ZUSksx5JpwB2K9IIBeUFsud9HE3J
         C+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865124; x=1791469924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1l6qHI+GEmzSB7BiAtUswOtZV3l54Q989xT5IOSPZw=;
        b=pFfOk9eY2XF5m4h+5dFpXDrJLmbrixCYS04/m62i5eWKBYD0hyAhR8TPUvXbrE2JGD
         S93XyEt5Fz+viYEbMvhkCjf4PvDUYjxae/iUls0R3hnO/8O+vG0d9ORMrh6bpPfc0fGY
         YhYPyBbHB7RKSMCq7FbsUyzjFIXWjgP7aYzM3j02S7AUMdTZNVnMZNBq98AmRWEG8gon
         YLz95ZraZ+TFUGccDo/VPRtILrAGZAsdnqEY3rmY5Dt2rtK2o2EhB7z7T0kiCK8sPrhJ
         vsNVzTS8SPmPk9KpPA3UpLhhl5ZeNa4KKgsEQSsiblA+ojEaC+ctEpQMhJUsvcXz5aao
         WEpw==
X-Forwarded-Encrypted: i=1; AKwUvByFaDnEy0xCRI2IwUJ8I4WsCZjEMjqiHulUVBxtmGKOW+6fHgu8F/exgHRG1RReqqUZ5NBegokUyj33@vger.kernel.org
X-Gm-Message-State: AFq9FYKMlgPeGS6EJYW/DOLm35BucfRr2w21qQQdblm2G2fxygsHFTqp
	8F0grk9DaH5sJqfcF8M1AuKGqHb0Bqq/JFhYyZPjH1MFPX7wy6wDLUNxuS3OygURI8sulU1LT+r
	ssAU7pgkDv/hgzzAVOUs8HmXexP8M0+QHEACrPfSoxreDhgmgIZli0whhmvNjVNLkROg2IP7U
X-Gm-Gg: AYBFou1oAH2rwhwZujIHO+rCyAruB91UHtSnkbC9c5gB228rdUKa7Nqn/XGbtG1/fTO
	0a0WbELAFkOiyjBUWHyekWoZt3xBeOwmv0QJILhjG4BVzCKNmg6kJ/NCVScmFoJU0O4fLlB0HOY
	yqC+nE1HZAboNj+DRdqClWbA0nZx0LBlAtcOgM5TbdRKlCRVFVBft4xvQlBehSTn/spjMM/1hVw
	T4agzvMrQ2V/KWUq2hnr9BB8/VDO5kmNzymi2aXLrNHKXcD2s0ZGto/jQqTLToTX04cYGbdcJWj
	4ljEPUl2Ls7ABh/PHAQ28TMTbE1ETyqRrE2mfYu5FxopV4CRrSGP9AzFm2lAuGpiUVQE2rHb+lD
	w97Mp2E1Ffln0n5afO+QdWMu1awM7
X-Received: by 2002:a05:6102:3ec1:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7be73a8e63cmr951300137.24.1790865123593;
        Thu, 01 Oct 2026 07:32:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec1:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7be73a8e63cmr951290137.24.1790865123082;
        Thu, 01 Oct 2026 07:32:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:47 +0200
Subject: [PATCH v2 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-1-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yy7Pib9Ot3rjpbb81T81P2yualDkr9btrCVtiyjdhb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7arGgWSkNh1UWH2RhGB0pxA2ciXPAaLPn7S
 1h4W7M6w2KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u2gAKCRAFnS7L/zaE
 wwUeEACh7rXiVwNmuaHRDGMZStz/A4A+P4qGany61NEtlDlKZp3d071ddvh1kju59DsTEuzvyth
 RCetqLqnsl7mHIMGeW8s8pSzHLZz4ILiHCy0dy5TZyhE5fPumgTkJA4o8EJEsM7Chrczt1g8RGk
 6+at3wAUsJVxUPOMNUK5mZCuBdL1HIPT2l/30s1GUS3XKXXIzG8coNYxvCZ3R4xP5nq8hIl337G
 47onkV8Tb4T/fdjPQPGeywiQOOpvzwWTmgr03ZsZSsq5ukAqM4uQU/hD8neqeqC+Sb9t/ns8U9N
 /Wb2Hf/a3VTs6aEk0ET2v/sdsSUtR3YonnYcqbZHYGzIJyPK6gww7pGsHIvwf/YfQYM5Alrf5qF
 2yWWU7VOQsecmZOq7p2xE9o+TW6vDq0HDBYKRXTAmaR/hRf1o1mwLocd3fC4GJY2yDzezcNZ3SX
 Muqom5amz2a4qGRa3aCShcsuKdR4FcLqPiWOGAkeJWq/JT/kKYaiY288bVtdd7M55LWXDartWI3
 Kg9n9DE898yGDGYDLzV+t2Ml6QxM6aiFMm4r+jYIBRIPO+ozl7uAqCJ+LD+KMkgCYidkCTfSZ8i
 mv7gyzOxA9qnz2kixgYpgSoEze/d9wgGpKZhS/pCOr2C8Kr71nABJiHpTusqXCGLOU1Xyk4SQp9
 kY9rRRYIcFcb3JA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX/zGZ8ajfZ91/
 Ek188LG/bc22oXN5UcFNH4I2zmCfqdfYozonGwLDarbVQjxo31ANnd4U6lFNksMjFOILfrQWqwR
 WOUHNZZoCSNxrU65BEkq4+UxsXbr8MI=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe6ee7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KwuEG1lCUIphvGhCtYAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 9L0lWGByO16B_K9jsNV1kawG_p69aZcK
X-Proofpoint-GUID: 9L0lWGByO16B_K9jsNV1kawG_p69aZcK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX2D474kVlKdoI
 /ckcdNqKVr50tavB3Kg6slS17YwcQ6rVdG6D/ay61bHaWJM89NOFR21h8INC1HP4qYIcZknNT/G
 I8Xn0Hl2VZHjbv/Y6Oe3i49z6zLFi4IWag++KALHtRnwCEVJnef5VfnfSSwIjscr/DOmCossDRs
 iPiDwvgWJZ9K6PoTKCjV8WI3Wj4sGWKV3xdUJi0rTp8dwVmlTpOfT1Gon2/2uWBfa/uVejHWjJT
 +l0jA5XtO19/H+sSup3nQ4BxwuiNKR4U+pobxcXnfjj7X+wa/isjHJBoQkfFTmcNZP5Egpgae4/
 eLlhvBrYL9JLXu4UGAeze4LsboK2lVUokTXc1HF/RuNiu83Z3oQuxGlLJ0veEEWa48H3wMn9fKx
 AsVosLXhBKBkx19SjHSnjD0i5cJj3rI1wxmeLpVZon+1HdV5sydcdhYIBtTAGrXqOKKlYZ79OIL
 R6z7VegFX1hnXs904aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010057

The GPIO lookup table can stay alive for longer than the kobject whose
name string's address we're assigning to lookup->dev_id. Fix a potential
UAF by duplicating the string.

Assisted-by: LLM
Cc: stable@vger.kernel.org
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 5f9623e40b0fbebcf318fcfb2e75768cf6e3f313..6acfec73b73477245c7e4c593f2925efbc8980c6 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -450,7 +450,6 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 				 const char *con_id, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
-	struct gpiod_lookup_table *lookup;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
 
@@ -480,18 +479,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			if (!key)
 				return -ENOMEM;
 
-			lookup = kzalloc_flex(*lookup, table, 2);
+			struct gpiod_lookup_table *lookup __free(kfree) =
+				kzalloc_flex(*lookup, table, 2);
 			if (!lookup)
 				return -ENOMEM;
 
 			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
 				 dev_id, key, ref->con_id ?: "none");
 
-			lookup->dev_id = dev_id;
+			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
+			if (!lookup->dev_id)
+				return -ENOMEM;
+
 			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
 						       ref->con_id, lflags);
 
-			ref->lookup = lookup;
+			ref->lookup = no_free_ptr(lookup);
 			gpiod_add_lookup_table(ref->lookup);
 
 			return 0;
@@ -611,6 +614,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			if (ref->lookup) {
 				gpiod_remove_lookup_table(ref->lookup);
 				kfree(ref->lookup->table[0].key);
+				kfree(ref->lookup->dev_id);
 				kfree(ref->lookup);
 				ref->lookup = NULL;
 			}

-- 
2.47.3

