Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499970;
	b=ovpan/Z79LyG60gBXCXRfha/tOkcF4qSSBqoB5a1affojnByetzSzAn4+cqFrY/8imp0
	 SubEpcNElwCtuxqtEnOBp1B8CrrQAHD3thFYNbgN6tWZgZSCix4ojjbcFxx3p3VuetYEx
	 jZTe4sGQTB625YoiuBQbTKCtEgYGRtP0l335lSKxPW5jgxm983QWFNMUbuHyuBD1d+0Jj
	 8hT7OAUSsBTV5uBzHLhWei8PeaCUyOuJ/4YRBluXxAhqJ21914Suh9tR5+GlqDJKbnhbU
	 acweCpsKkvK/bjAA2mdmfQ8s8yPO2e29heN/3hQAJIN6xKh7+jSTPvncmPeul89766g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
	b=aQmhSP2voBWlZtJZcz1JxAhNfqObMqbKlAl3D9DldfKdFMG2BmL191GnoO2uns2uLQeK
	 7AIZq+p6fKbeCaeu+M8m2dex/tpjE/jo4tremNi3wtZWn+EbtCFAJ90pwjvZr0oON2Rkh
	 nd/DLZdR6ztwOe5aQxSd4cfRY8/j8HUMMRYt4eFLT5NJT5vx42Wll0xZ26BxcJMuQM25O
	 T+jrVqVNO4+P66GJWQwGSnQ7EXY8h6m7A5ey4mX8yVrqdcfjxzSf04ukdv23kfupPb4nY
	 wwP4Hjz7k7dxdjKfp2RTt8GS6jQL3ZqE2x2Ndi/2leIn8CwBc86ow4dK31LyDluF/Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZeMs93Ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htxbZtye;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BE606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZeMs93Ps;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htxbZtye
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBYNfZ066604
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0T5UEqM37tb/Fx8FSAIKKR
	izP5JlR3aPXSNzfInYCk4=; b=ZeMs93PsdDZMD1/kWpZmnfrC6xH6EbLOAhwL5c
	xz2xmy2rycvyXwLFCkPTbW0telYh3W7E9a5VJJZhxetu7C6BRP/eW5KwcQJ5FkJX
	Vvf6gum5WLipzwshGrkTftn5AHKpUc7zIOkfEBiKPUYQ7EvwlBBlNeIgzUPPOv3G
	TooMUpDA2AgdHP/JQFw6tCLjzx5Oipnd8cmTFl1vfM3J9u3RMdVHXG9vezYsuWwW
	UvoODsi1dvHAQ2ZShN/4jG0nkrxiXBgfLF0o0FwWNCpU2gqUxYcATOOee4ZKGGWV
	uUG+8sN0L4/ZhSR7Pi7VhsUn7f7s1WytUQmBjlANdWPjjKIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv86ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:39:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so375136585a.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499969; x=1793104769; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
        b=htxbZtyeTqA1Nx8ed69uwpgtZh5I/LmthxxAVPqnpAGiJRGUkMF6uEnCViokzvaEuE
         C9FNoGfssgkpSqafp8OdMXT+uYxIx50tfru/7uez77m9BUt39thV9ATtXwCK+N7+07gI
         WqLgZ/2miyTgiwGuWIfyZIcVjUFTiKWEoJrgXT68KcwxFF+nhxc53qTUvGD53FNlmawO
         x//N4MZDTZ6K08UOPorV1CMugElGsK0CKwO91esiZQ+G39PXrCXGFeLt4sewFFOjhMlq
         +IWaURDWPbR1R1Xeqf6D672yfw1AgcAHjdWaDpc9i+//RWWk7x4H6Ta+Is+96gNU6nYH
         C5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499969; x=1793104769;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0T5UEqM37tb/Fx8FSAIKKRizP5JlR3aPXSNzfInYCk4=;
        b=KFeoIPUfb1Moy4PDAlMteA4rl8tAwRg4zhZ93h92lHY8HD6NIyt6meRLLs0mLWbi6R
         b7MzPk/FbECIeMlVLLRdhnuuS4sMYqGeTyJgWs46q4aNCRstxfSp//AisaWrHmi+Rhet
         +LWf8YW7nmvqioExfeRqfdVCvCV2CLllmRtrZDYYfcact6iVowRwU/HMO8eikhPByp0C
         wdsk1MIVNmVg2XJ5H/qAYpoCBnsyuneo2tbsEStYJ/61v/Vfj05xExey5hckt3pIERyv
         HhR06G7yDaHxWe+JNAEKmMASn7jSArsX6md6iF+IcfcdT95t3viZnvfmOWClCP1srhih
         Et1w==
X-Gm-Message-State: AFq9FYKobgci8L01MmcNNFx7xttWJLm5jdhRGu1J32Tzv8YvWxeanwkg
	vQc6hSiAAXXQ6ReQIL7gb+Um9FSeVnyjWMr6mG6Ia0WdeDjulB56oT2xQnpX4Jv6QTH/DvfQvmo
	Hy3mu8dL4PjfmPJoibkAoq4G71nk5SV+66zoeIfemAQz1ONKW3r1LFAu1yf3h+K8R
X-Gm-Gg: AYBFou1rpM2SqjFCUcUKvWji8ZPt9eKlqhz7uop2XU+SRkdueMFCHIe4jOBVixg8q7D
	D09kFaRU8zwqy0zlaUHx/6hUJv3mKJe4lR66gnEPiIO9NBdu9MlI9HBWdrv24aS80d6+qVS7266
	V+3zsx1O9XYTCVcwVrbjMzM4RhQX6w+i50odIFwYFSC1qZ6Cx5/PK2FMnXyBYr51FVSnxQqSccv
	PuO9toVkd5PojBJOsmVRbgIu9zirfMmlemUbKPSBADqoN7+yw+wfy51rhooskHoBvjBvoj9/FQY
	hY5xBYxFSEtqoGscuV74JF7M3ytEcCssUqiJD7SvWUjHNEhuZq3b7l3f1DfnSjDBF/g/ko2fz0k
	l57es3xmW7mW+GwzIGgYr84tJd5dh
X-Received: by 2002:a05:620a:40ca:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f29d53d0fmr1784263785a.43.1792499968647;
        Tue, 20 Oct 2026 05:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:93f:22f4:f0cb with SMTP id af79cd13be357-93f29d53d0fmr1784260285a.43.1792499968107;
        Tue, 20 Oct 2026 05:39:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214b5sm6333982f8f.41.2026.10.20.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:39:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:39:23 +0200
Subject: [PATCH v2] gpio: sim: constify struct configfs_attribute
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPpg12oC/42NQQ6CMBBFr0K6dkinELSuvIdhgXUKkwjFTiUaw
 t2tnMDNS95fvL8qocgk6lysKtLCwmHKYg6FckM39QR8z66MNg1qtNDPHEB4BBcmST967r1Al1I
 UaLQ71oYqrLFRuTFH8vze+9c2+8CSQvzsdwv+1n/LCwICWW/R3irj9ekSRMrnq3u4MI5lhmq3b
 fsClwDnb9EAAAA=
X-Change-ID: 20261019-gpio-sim-const-configfs-attrs-60c742e31416
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4412;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8YkCpQ0uPMvdW5e+uh2l8mxg+nfuAwKAw6RIAitPodU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq12D7i3xI+Ac6Yk0QcvsqpeKUEM96P6XzUjPIU
 bw79yL6ZkKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatdg+wAKCRAFnS7L/zaE
 w9rPD/wIthpAwd1BvuDuGO83CW1fAS9atpoLjrfCDn2CmlMsNukzsX43QzIGTstCbLibFedvbQU
 ToJK0H45EFSXGIwg6VMqM0F+7PunZPphud7D6avToKIg1iBvFNNzj5JKmLMXBi5GzTazn+fcP8s
 E6SKbUo8IkJ2Nj/TIIDTotJN3fVo+KSj2m6+QUiHS2wApsFBVgtU51GXXhmeLx+61zyVwriK4Ov
 gC4JXt997pC168xg03B7KQNOs7dTs2OkSWttf9nriVm9+jXo2C7TjSKOjh6n/ItPmKVMh8PwHdc
 Ra8F1Tpzy7bZ2SB1uiVzmcUI5eaJS+wuliwOXXY6ZZgIhyT5zU3Jiscoher1cqJkIgdncTMVaMb
 wZmt0z5dQrvR3o2Bghtj/aVpZv5/2zeSxcAZfWkn9D2Zm7ZA6EuAHAEBIXumCy7zIrlVAlmgwPC
 +c7gJWOczGJh+6RRtves4yN7XfN1z92heqRpZyrMH4IbZjckT+aah87vKCJTrGHzD2RV75GdQTZ
 VSdUPFoZxLnE0GHb1Kp9pv1hKOgqMwgMdmfUuavG6AYOUAYEFumveQjParkilL3ZV7WbCCyWERZ
 rCmg4lR785xp50SBRE31u8reVbDxQo4A4adAvrc74ITs1J0Au0bHEc7Vzx5t65Z6RTMEVmfm/jf
 Xot1MHZ6K0MeA0w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX6UJ/FmtHrsaE
 o8qUXIJH/fvz09jtMl82zAp5zEKoN2IlM9RLjVncGahSmO3gYZYGxoEyXJPg8o2SFmGS5FOLg4y
 Tnc0P2lGOpEwUS20kQ/lkH90Uk7z9fXM2W2piawLUoK3Arr03f/q0Mou8fm+kKSDSGj22m/q+FE
 Q2KaI+4Z87Aez1eJs3tYvRJorDafp9fqojT2kABZFOnw8NvzfIZYncErXllaHPGNOOmDA59VwAt
 PKk+PqvQA5XtYa38tv8+0AxeKhiytV08IC9+tDrA4bo42DLT6lld28zan8UJT9oAyyOJn8lwHX8
 8N24cFOqVxl8B4yyimctwUFx6FHZOuQcd8N52iSehO3x2l8gkogE5KlGX4VD+w19Q6ysHE9NxHn
 5ES7w/K6kF2Cd4FNKX5avzmvZstf2tHnpsAFBQGyQi3rhgALYuDZqrYPt7uLbzSDgyDM/ZMF0Qh
 SVIpDt8QekCp3RNMebQ==
X-Proofpoint-ORIG-GUID: 29cSnS0IX1rqd1tkNIXNSDhAkDSk6UbG
X-Proofpoint-GUID: 29cSnS0IX1rqd1tkNIXNSDhAkDSk6UbG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX9H5KCn+qJqyZ
 VMdg1ZIbz+6oL5clxUhKC6ZqPFHXu09vI3780HmcKeCAWw1+QtY0akI75fYxzmOTU4uYsK3eG/R
 yTlz1G57whr+csz7snj4uzVXuTFt38Y=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad76101 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xbmJlAN1-OECOda96uYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

In preparation for the constification of configfs attributes, make the
existing instances of struct configfs_attribute in gpio-sim const and
use the new st_attrs_const field of struct config_item_type.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Closes: https://lore.kernel.org/all/20261016105712-707634de-c955-4c66-957a-2bdb84bca3e4@linutronix.de/
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Constify the pointer to configfs_attribute AND the data
- Link to v1: https://patch.msgid.link/20261019-gpio-sim-const-configfs-attrs-v1-1-e9f919b32f08@oss.qualcomm.com
---
 drivers/gpio/gpio-sim.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..8f587be8c5e4155290673d28fb048824f5bb8863 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1037,7 +1037,7 @@ gpio_sim_device_config_live_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_device_config_, live);
 
-static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_device_config_attrs[] = {
 	&gpio_sim_device_config_attr_dev_name,
 	&gpio_sim_device_config_attr_live,
 	NULL
@@ -1154,7 +1154,7 @@ gpio_sim_bank_config_num_lines_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
 
-static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_bank_config_attrs[] = {
 	&gpio_sim_bank_config_attr_chip_name,
 	&gpio_sim_bank_config_attr_label,
 	&gpio_sim_bank_config_attr_num_lines,
@@ -1228,7 +1228,7 @@ static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_line_config_, valid);
 
-static struct configfs_attribute *gpio_sim_line_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_line_config_attrs[] = {
 	&gpio_sim_line_config_attr_name,
 	&gpio_sim_line_config_attr_valid,
 	NULL
@@ -1364,7 +1364,7 @@ gpio_sim_hog_config_active_low_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_hog_config_, active_low);
 
-static struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_hog_config_attrs[] = {
 	&gpio_sim_hog_config_attr_name,
 	&gpio_sim_hog_config_attr_direction,
 	&gpio_sim_hog_config_attr_active_low,
@@ -1390,7 +1390,7 @@ static const struct configfs_item_operations gpio_sim_hog_config_item_ops = {
 
 static const struct config_item_type gpio_sim_hog_config_type = {
 	.ct_item_ops	= &gpio_sim_hog_config_item_ops,
-	.ct_attrs	= gpio_sim_hog_config_attrs,
+	.ct_attrs_const	= gpio_sim_hog_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1444,7 +1444,7 @@ static const struct configfs_group_operations gpio_sim_line_config_group_ops = {
 static const struct config_item_type gpio_sim_line_config_type = {
 	.ct_item_ops	= &gpio_sim_line_config_item_ops,
 	.ct_group_ops	= &gpio_sim_line_config_group_ops,
-	.ct_attrs	= gpio_sim_line_config_attrs,
+	.ct_attrs_const	= gpio_sim_line_config_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
@@ -1505,7 +1505,7 @@ static const struct configfs_group_operations gpio_sim_bank_config_group_ops = {
 static const struct config_item_type gpio_sim_bank_config_group_type = {
 	.ct_item_ops	= &gpio_sim_bank_config_item_ops,
 	.ct_group_ops	= &gpio_sim_bank_config_group_ops,
-	.ct_attrs	= gpio_sim_bank_config_attrs,
+	.ct_attrs_const	= gpio_sim_bank_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1560,7 +1560,7 @@ static const struct configfs_group_operations gpio_sim_device_config_group_ops =
 static const struct config_item_type gpio_sim_device_config_group_type = {
 	.ct_item_ops	= &gpio_sim_device_config_item_ops,
 	.ct_group_ops	= &gpio_sim_device_config_group_ops,
-	.ct_attrs	= gpio_sim_device_config_attrs,
+	.ct_attrs_const	= gpio_sim_device_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261019-gpio-sim-const-configfs-attrs-60c742e31416

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

