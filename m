Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178840;
	b=gAhRM8SpmAE3URowaXUGFcxjjrfXcwm2gFOiwUbhyhx9e07nlsafSLALQbhAlJcG3IfF
	 Hu5tzEffvR2Yn79dRNQSpFM8fcu+EaJyyO+SnRHlk41kZvWUNXN2h+5yMZbWIAbfBifgp
	 75IabLc8ks3OT0TOqmLMx0VQy1J74CETzpkIckEqy1OdxFy7nwore9XKeDwsPPGQs802W
	 G28wDGM7i8RA7JdxbPBKATPTkAIIRM2xoyKSjwOoNGp/aLNVdQUC7k6lOvg3gGjS+tLw3
	 RhX5MvX+eAiW0blgE+xsdgkoUxzzkw9ZEG3i4tBiX6GZIoI0fEK1ABNRahTOsLFNBfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
	b=Ubxq4LLSWcfWrN13aLEeEMEfDDeJP/hMkwwV0sLH8JsKRG2JYo3LaNO4HrXuhPc2539u
	 PMBibigfPyWYjvoAbY6/S4TRSAnxef5Z8bI/CTLSTJZetLDp4I/pjjN0ZRdYvAQPTSqXE
	 km4Cxy0tdmJL/y7OSRkNaI47nLewNpEwNknLAtm/OwPxeT0TmpzthhHQ4E//RC/Hxm+AD
	 +4J2mWwxukf9Jx/YUS2WHGofeszQmNMBgkdnwClQuPqCHRAlhCV9DbOBt5w0jqG9Koivg
	 vFFRBkemsLJHhND5REkZ+okybDHrQiHiRsMHwd8CLqmNY0ro+bQQC6E9F0mTCCsesgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4HDSQWb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNWZH1ah;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AB60A261F
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879AB60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4HDSQWb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNWZH1ah
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwVb2155212
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=; b=A4HDSQWbiD6HZnqb
	rtwVMxR9QACZoxdiDvE2TqezA4MQJBrot46ceTynX6t2Ays7OJNgX8Irc5bjNXFJ
	rcfd7enmeAxKVcxWkk4twTTQZdQZSa5p/QYlOauPK0rgUK0sjlJqqDs85NfLe7bt
	nNohHEvvywLaxN7nSbtda/8bqVDd4CMbnJZsHAPBTVpdLnwGAwXThgfrdd3vPQU/
	myD8NpXKqWHOgP0kbZJyCBdt1dE2VtdPaYX3RznmRpUMbq4PYc2Ti6BJ1h8HuHcQ
	duongUjmWUmZ7Th/aTtZsPlaFouN+Y3zi45RJR8ILKLIdwbQtS120YCa9yo8Uunl
	wiaR9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhyhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:47:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso151307585a.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178838; x=1795783638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
        b=QNWZH1ahOxoJ6lzjC+5dJJP321vfIbSUCaUrNaWbTnoWoK55UM4KiKj0byKYi81biT
         Q7Ewlg3td29GbZ1K7YsoEUYFdm/WCuWvER4l11zeQwdkhVQbVZJAwklFY6M9uHWg3cfm
         HL1G8UcWBdyMed6V9NA0Ay7jH9nB+nFdc8K/7UWY/LiVHD0eP468ajFyQfBJXqkcMjYx
         /mwp2j6ChkT7gkRf/WyfS2T/LvCDyPlabYqd4IuaTOgqURq0TYqoIt/4HIxhY6ujiZ+d
         vfLxs1v6h7HWme2BVDRHwZZAKOMtABWPwIKc52UlD6C4uUJdVcEYvnq0zArZMWHZ+SMD
         66pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178838; x=1795783638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NS8BjovI5HLBofxvJMHQYZRCR3joIuKOlILvwQZbuIw=;
        b=hOvfcLH/wTINESEkbBn9DHXZViy3Upf/A9erEfCfsyT+/uhldgAMSFEYS8jjA1XpFZ
         CfQJLgHW124SUHqRB6cJGYAjH2dT+0E0aa59HtPOqwHyjmFhZGyFl/LgeIqPcnyoBGwY
         A1DnwUPD+SImtQ2P48JWGOINobQPaE9mmQcVpiUzSyL0Dkz/j6z+xUwUypqUdx9nWLsG
         s5QkHoCoLaio+NnfD6gr78gbt2NP+mW6Oc/8IPwNr8NQSj1R3zsqBEcV37WADnacqfJR
         jwRGr2KH+vK4TE+49UD8lOQwSJUwdpRBBbuRj1LumM8DVzGRKxTesxlAyrv6LCysAATI
         5pXQ==
X-Forwarded-Encrypted: i=1; AL+hErEqcKQY4lBgsHNj+7w87B0FncrJGRBSW4g1GNwLCD24guGBrYrRagWP3byUUVEWsvUpCJUsr1D538Hg@vger.kernel.org
X-Gm-Message-State: APuU4Z8QxTCOaX/YVhasx6JcrtH4il/rUpWMb8UVMOL5+ceJvfZGfRpm
	QLlyTkIGtAAZIa+5AGX2/CHjiwjNocGRKJvmWAgn7oqWHHbhyoPKvHJf+KSW94QxbOreyvj6jsi
	fxcUXFmhdJhWRyOX59XJDli3Ugxh6E2N8X9l42UtMdXfvbKqGV+Naa2s+ZK0Z7TLP
X-Gm-Gg: AYBFou2HqSAMCFUiQdvD4g4YuOOVgEbFq+U5aRjU6DvLCQFmnxgUw7X6TYbBe/e3UXM
	gz/NZ7FM8bimXjTLIhgbVy+89SN1JO3N9Fuo5pr8t4w/xyBOwvkM3ZvImLFfB6XHaew74ROWmQb
	yJuTboXs0Ta7Yx2L56te9vOnrMS5F9uaCPgcoXJA3iCtbp5itXcUsKGV7/koGIP9KjP0/NrW/ze
	S35ui5KkgF1Skq8ZTQRq5DNPQkBBHwOZZ1fqB+bGLJDh49DkVZl9PfOr5xu1RjtnwhoXj2YfjXY
	HRCPw2rb9gZDm8dTY02Gzm267sWNgoFEOPxPEXImZqCw2GqqEqnvzt35Ybp7hB+qi+6sOH54cbv
	inZ4EHVxp4hoHDy3pmkyWmI79NEgAp1NmGEpoMGfyaf/iIbhSDzNi5vteyNj0QYdEoVJfjjOsfY
	c=
X-Received: by 2002:a05:620a:4492:b0:949:7fb4:2712 with SMTP id af79cd13be357-949bab123c2mr454614485a.66.1795178837729;
        Fri, 20 Nov 2026 04:47:17 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:949:7fb4:2712 with SMTP id af79cd13be357-949bab123c2mr454609285a.66.1795178837182;
        Fri, 20 Nov 2026 04:47:17 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:47 +0100
Subject: [PATCH v3 10/10] gpio: shared: generalize most code to firmware
 nodes
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
Message-Id: <20261120-fwnode-for-each-prop-v3-10-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10642;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Iv1IM5MIQo5zDnbSeGyHkNB7sywHcbJdjw/Y4b/rMx8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4dhvnqlk3Wr6j2erkEhrd8hVycyEjLcRAS
 b+Pr2rWQVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w0ToEACB14ApfaKZHAECsmUMushTze/aQzofn9c5/yYGY4u0E7D1ZKw3mf65lq7arf4riCHqhY9
 /GGO+EN62WQeAY5PcYlqergHrjsMi517+O2xvf2zKnHBgBDeLyVnkpAYJRpYbWArgrxXcZmJ1Bd
 13lUVdr0tvWLWIHeuBqj3r5Q8FK6Zvq/X9IDvZbzVOX/LMa+I3V/TBgr0LbV994ZYl1klDz7ekF
 7t7GxVYp3XbFc++85rWtXIqZvArsQLvSwKIlpTOpF6HxBDjFR3m/60bNG2lch6svfbtOpiIUoDR
 nI2Blq5RILL8f3nOkFmEkvCQI2fAEonvUaLCDLfdKOcop1yN4zerYN23vq1DNJ0WzrTCRMQ0F0X
 Udl7YUI+HZEQL45EnnY/jvQo8TvXBmeyOSz0D49TDFL6aENZywtV8PIy2C/UXv8h72jiDOcc+gV
 FaCfyh693TCvJpu1kzVaSmM7oW1U6oDF7WzrI/mbPYkkjKRMLjIPtj7yiTBonWdkljS9FEV1GWs
 CmAm+sTPFbHFZjOvofsmi/UghzjYVTjKVKzWrzqd37p7A6OBi3cKD8ao9TodsfrVus5mnXXH+OB
 pFi4YHrmDCQ2mgwpYB65GAAsFAvlE2l8MPh0UZz0qjUFVNqsDj2+FEg0iu4Grh+byoz8G++vsBj
 Qge2/Wfdzegj9Dw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004156 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ziVQ5hnd3nnfPSIR4FkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX1iCsWQnDNeSd
 ZAdXSol64fJ1Shu5P0VOSxFEq96THjd0CtrxHiQ4Z09MdvE1yIhkWlLBa052GX0Yv6z8yPEAPQo
 rPvIkIHT4ocnFppXZasSGFU2KE8zmiIhHvsxs9UA8JEMeHOsdeEAg6N0msQ0gK6UDkQI3gW1bV0
 jK3rnFcuaSOo5DQpk1UqnZkbEGVShqweIC6bwU1LeNMerlzjyFOYSgbVxuift6XoZlG4xduujt+
 uIpAGEhfmHTlsu3lrHFrhTqtdcYNz0T12+bN+boApgy+FzibnepQhmLYv62N+3mdiu3Is1r7Crd
 EzOelsCFfg5DfwO8xfCHEySj/2FrYjCS0CWibFAnHkouiZA7evPRc4ilBcMw6Hw842B/KX38UbT
 nq2HErAZOqwDsgd9PuSMRBbhc/uxDBbtPwe2ima+zbLgy9vpg2IcfU3lwbjsxk1zDxGbr+sBsZd
 EXfCiRcogVBR8b2SZZg==
X-Proofpoint-GUID: xKSQN8zaxfUnidg1Yb_lZkGq6IGZKPki
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXw95fMTh0WUdi
 OF2B+PHkPVotOwREClmaijGuIXU5Sn7kAbdvsjp8C3psnBziQyUX2GGL1Qp19lcI6HgyYfkzDlD
 LP658vnL3a9Ed7khQX1/50qoOGufQ7s=
X-Proofpoint-ORIG-GUID: xKSQN8zaxfUnidg1Yb_lZkGq6IGZKPki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Ahead of adding support for sharing of GPIOs for other types of firmware
nodes, convert as much code in gpiolib-shared.c as possible to using
fwnode APIs and guard the remaining OF-specific bits with CONFIG_OF
guards.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 236 ++++++++++++++++++++++--------------------
 1 file changed, 125 insertions(+), 111 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index fbabc1ee489f881084033f7b92b42397455f5811..3b40874fc6a0e6b4591b58b164030ea73a355d2c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -22,7 +22,7 @@
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
@@ -60,7 +60,6 @@ struct gpio_shared_entry {
 static LIST_HEAD(gpio_shared_list);
 static DEFINE_IDA(gpio_shared_ida);
 
-#if IS_ENABLED(CONFIG_OF)
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -126,157 +125,158 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 }
 
 /* Handle all special nodes that we should ignore. */
-static bool gpio_shared_of_node_ignore(struct device_node *node)
+static bool gpio_shared_fwnode_ignore(struct fwnode_handle *fwnode)
 {
 	/* Ignore disabled devices. */
-	if (!of_device_is_available(node))
+	if (!fwnode_device_is_available(fwnode))
 		return true;
 
 	/*
-	 * __symbols__ is a special, internal node and should not be considered
-	 * when scanning for shared GPIOs.
+	 * On OF-systems __symbols__ is a special, internal node and should not
+	 * be considered when scanning for shared GPIOs.
 	 */
-	if (of_node_name_eq(node, "__symbols__"))
+	if (fwnode_name_eq(fwnode, "__symbols__"))
 		return true;
 
 	/*
 	 * GPIO hogs have a "gpios" property which is not a phandle and can't
 	 * possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (fwnode_property_present(fwnode, "gpio-hog"))
 		return true;
 
 	return false;
 }
 
-static int gpio_shared_of_traverse(struct device_node *curr)
+static int gpio_shared_fwnode_scan_property(struct fwnode_handle *curr,
+					    const char *propname)
 {
+	struct fwnode_reference_args args;
 	struct gpio_shared_entry *entry;
 	size_t con_id_len, suffix_len;
-	struct fwnode_handle *fwnode;
-	struct of_phandle_args args;
 	struct gpio_shared_ref *ref;
-	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
-	int ret, count, i;
+	int ret, i, count;
 
-	if (gpio_shared_of_node_ignore(curr))
+	/*
+	 * The standard name for a GPIO property is "foo-gpios"
+	 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+	 * There are some legacy device-trees which have a different
+	 * naming convention and for which we have rename quirks in
+	 * place in gpiolib-of.c. I don't think any of them require
+	 * support for shared GPIOs so for now let's just ignore
+	 * them. We can always just export the quirk list and
+	 * iterate over it here.
+	 */
+	if (!strsuffix(propname, "-gpios") && !strsuffix(propname, "-gpio") &&
+	    strcmp(propname, "gpios") != 0 && strcmp(propname, "gpio") != 0)
 		return 0;
 
-	for_each_property_of_node(curr, prop) {
-		/*
-		 * The standard name for a GPIO property is "foo-gpios"
-		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
-		 * There are some legacy device-trees which have a different
-		 * naming convention and for which we have rename quirks in
-		 * place in gpiolib-of.c. I don't think any of them require
-		 * support for shared GPIOs so for now let's just ignore
-		 * them. We can always just export the quirk list and
-		 * iterate over it here.
-		 */
-		if (!strsuffix(prop->name, "-gpios") &&
-		    !strsuffix(prop->name, "-gpio") &&
-		    strcmp(prop->name, "gpios") != 0 &&
-		    strcmp(prop->name, "gpio") != 0)
-			continue;
-
-		count = of_count_phandle_with_args(curr, prop->name,
-						   "#gpio-cells");
-		if (count <= 0)
-			continue;
+	count = fwnode_property_count_references(curr, propname, "#gpio-cells");
+	if (count <= 0)
+		return 0;
 
-		for (i = 0; i < count; i++) {
-			struct device_node *np __free(device_node) = NULL;
-			char *con_id __free(kfree) = NULL;
+	for (i = 0; i < count; i++) {
+		char *con_id __free(kfree) = NULL;
 
-			ret = of_parse_phandle_with_args(curr, prop->name,
-							 "#gpio-cells", i,
+		ret = fwnode_property_get_reference_args(curr, propname,
+							 "#gpio-cells", 0, i,
 							 &args);
-			if (ret)
-				continue;
+		if (ret)
+			continue;
 
-			np = args.np;
+		struct fwnode_handle *fwnode __free(fwnode_handle) = args.fwnode;
 
-			if (!of_property_present(np, "gpio-controller"))
-				continue;
+		if (!fwnode_property_present(fwnode, "gpio-controller"))
+			continue;
 
-			/*
-			 * We support 1, 2 and 3 cell GPIO bindings in the
-			 * kernel currently. There's only one old MIPS dts that
-			 * has a one-cell binding but there's no associated
-			 * consumer so it may as well be an error. There don't
-			 * seem to be any 3-cell users of non-exclusive GPIOs,
-			 * so we can skip this as well. Let's occupy ourselves
-			 * with the predominant 2-cell binding with the first
-			 * cell indicating the hardware offset of the GPIO and
-			 * the second defining the GPIO flags of the request.
-			 */
-			if (args.args_count != 2)
-				continue;
+		/*
+		 * We support 1, 2 and 3 cell GPIO bindings in the
+		 * kernel currently. There's only one old MIPS dts that
+		 * has a one-cell binding but there's no associated
+		 * consumer so it may as well be an error. There don't
+		 * seem to be any 3-cell users of non-exclusive GPIOs,
+		 * so we can skip this as well. Let's occupy ourselves
+		 * with the predominant 2-cell binding with the first
+		 * cell indicating the hardware offset of the GPIO and
+		 * the second defining the GPIO flags of the request.
+		 */
+		if (args.nargs != 2)
+			continue;
 
-			fwnode = of_fwnode_handle(args.np);
-			offset = args.args[0];
+		offset = args.args[0];
 
-			entry = gpio_shared_find_entry(fwnode, offset);
-			if (!entry) {
-				entry = kzalloc_obj(*entry);
-				if (!entry)
-					return -ENOMEM;
+		entry = gpio_shared_find_entry(fwnode, offset);
+		if (!entry) {
+			entry = kzalloc_obj(*entry);
+			if (!entry)
+				return -ENOMEM;
 
-				entry->fwnode = fwnode_handle_get(fwnode);
-				entry->offset = offset;
-				INIT_LIST_HEAD(&entry->refs);
-				mutex_init(&entry->lock);
+			entry->fwnode = fwnode_handle_get(fwnode);
+			entry->offset = offset;
+			INIT_LIST_HEAD(&entry->refs);
+			mutex_init(&entry->lock);
 
-				list_add_tail(&entry->list, &gpio_shared_list);
-			}
+			list_add_tail(&entry->list, &gpio_shared_list);
+		}
 
-			if (strsuffix(prop->name, "gpios"))
-				suffix = "-gpios";
-			else if (strsuffix(prop->name, "gpio"))
-				suffix = "-gpio";
-			else
-				suffix = NULL;
-			if (!suffix)
-				continue;
+		if (strsuffix(propname, "gpios"))
+			suffix = "-gpios";
+		else if (strsuffix(propname, "gpio"))
+			suffix = "-gpio";
+		else
+			suffix = NULL;
+		if (!suffix)
+			continue;
 
-			/* We only set con_id if there's actually one. */
-			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!con_id)
-					return -ENOMEM;
+		/* We only set con_id if there's actually one. */
+		if (strcmp(propname, "gpios") && strcmp(propname, "gpio")) {
+			con_id = kstrdup(propname, GFP_KERNEL);
+			if (!con_id)
+				return -ENOMEM;
 
-				con_id_len = strlen(con_id);
-				suffix_len = strlen(suffix);
+			con_id_len = strlen(con_id);
+			suffix_len = strlen(suffix);
 
-				con_id[con_id_len - suffix_len] = '\0';
-			}
+			con_id[con_id_len - suffix_len] = '\0';
+		}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
-			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
-			if (!ref) {
-				fwnode_handle_put(curr_fwnode);
-				return -ENOMEM;
-			}
+		ref = gpio_shared_make_ref(fwnode_handle_get(curr), con_id, args.args[1]);
+		if (!ref) {
+			fwnode_handle_put(curr);
+			return -ENOMEM;
+		}
 
-			if (!list_empty(&entry->refs))
-				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-					 entry->offset, fwnode_get_name(entry->fwnode));
+		if (!list_empty(&entry->refs))
+			pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+				 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&ref->list, &entry->refs);
+		list_add_tail(&ref->list, &entry->refs);
 
-			if (strcmp(prop->name, "reset-gpios") == 0) {
-				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
-				if (ret)
-					return ret;
-			}
+		if (strcmp(propname, "reset-gpios") == 0) {
+			ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+			if (ret)
+				return ret;
 		}
 	}
 
-	for_each_child_of_node_scoped(curr, child) {
-		ret = gpio_shared_of_traverse(child);
+	return 0;
+}
+
+static int gpio_shared_fwnode_scan_properties(struct fwnode_handle *curr)
+{
+	char **props;
+	int ret, i;
+
+	ret = fwnode_property_get_names(curr, &props);
+	if (ret <= 0)
+		return ret;
+
+	CLASS(strarray, names)(props, ret);
+
+	for (i = 0; i < names.n; i++) {
+		ret = gpio_shared_fwnode_scan_property(curr, names.array[i]);
 		if (ret)
 			return ret;
 	}
@@ -284,19 +284,33 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	return 0;
 }
 
-static int gpio_shared_of_scan(void)
+static __maybe_unused int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
 {
-	if (of_root)
-		return gpio_shared_of_traverse(of_root);
+	int ret;
+
+	if (gpio_shared_fwnode_ignore(curr))
+		return 0;
+
+	ret = gpio_shared_fwnode_scan_properties(curr);
+	if (ret)
+		return ret;
+
+	fwnode_for_each_child_node_scoped(curr, child) {
+		ret = gpio_shared_fwnode_traverse(child);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-#else
+
 static int gpio_shared_of_scan(void)
 {
+	if (IS_ENABLED(CONFIG_OF) && of_root)
+		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
+
 	return 0;
 }
-#endif /* CONFIG_OF */
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {

-- 
2.47.3

