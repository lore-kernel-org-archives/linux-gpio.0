Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005928;
	b=T6tDeTYJ+hcXAqu1QLNUsYk4hBp8+6uLoVQ6I0uzDLt0k3v3Z4p/uZU0ffqNAlN/URTT
	 ZFP5E/i1hbRnsW2LTuF0gD7DQW5xMhNK71/OYECXEJiqkJh3VKF3ubYsRFrZER2+HWxvP
	 XP9pVtCNAaOxrWIbBUBHDBFSb1OoN+4zQoFR5KyZo29LfZBLGBhKXp5nPYfG3lqAakVR0
	 xOpQ5WQJLsQY0HvnkoPw5NzuTh8SqlGgZE91LHU7mUOyyZFdQUeB300Pzjyx3E8bwIi5p
	 dNwVo5WJj6fD1frmMwmHYSy4omHT/cCBS0tajfFtkAaiCSxuv0wQ/taVHEXUTdpTvrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4QkJBgihenUd1kRurtl3rk0D12BilxuABfR9/a1XNzA=;
	b=1B6+s7s6JrvNwbqZcmD1bSah693theThn745oUTn5pzdUMb6o4VAy+uB8hf7FC8XFQqw
	 6s8dy45s+pUkDopKXDAzd5Uhj4d7jzAMjajJgBznAgPhhX6vgycTJH9g6laioMZbyqZTf
	 pFh9Z7PVxYB2Fyd3WNdpqMWzkycM11ulMp1FYyE0gqeBYtpsk2cp+tKLXjMdusWiTBLEx
	 kpDl86GjWlBUaCZ+tyXd+e40gcbkBJQmxpG3xgKxKgUDc9Sj2B3aPqZP9NBucz8QjmQ0Y
	 kv0TGDAwep2lwH2qvogztKX1a8ZpNBg5OUaaXw+b1FIqAAXPn6HtoCdj2qEWUBCZSSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXO7w9XF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O1jH1IL4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0D606A320
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C0D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXO7w9XF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O1jH1IL4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLId52748077
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4QkJBgihenUd1kRurtl3rk
	0D12BilxuABfR9/a1XNzA=; b=BXO7w9XFhrDMchPMpmFOrV6DIDGAPhl/EX9M9I
	uwveTxiyV9TRpdEHq3qQ4vshsnc7xag8lEt5/ISLJoYauPJxDSvLu9nYdGe+gGF/
	lur9XKkqZCnPrVc3WgNsLbVS99tgmQPMV3cZ/6wmXqNvuxzuxwz22q1tiC3d/I5q
	D8jX3Ag0+pc/AlMAu8Pj249AGlph+reZpNGCw8vW/DJ0ZVz799Y///0ha2/lp3R9
	Q9//fMPRE8P8rtr9bGt6Djq6RnJTb5kY1zYKAUWwGasQGRL+Z22p7QQA8RajuPrb
	uGQdRjwm4x4Hx2601xfd6v1/rvAsidIgA+3R4pYD1lwVU4EQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv932pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:45:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso16093681cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 04:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795005926; x=1795610726; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4QkJBgihenUd1kRurtl3rk0D12BilxuABfR9/a1XNzA=;
        b=O1jH1IL4NJDhmsWwYiP3tNx3eE6C2VQ5U79cMP8+rLFZi7XJwWluT8aCaY+zhMR1Ic
         C12hGpHCtg5evmne94w3ecwb+CfiVfACXl4M9KW7AwjCWKNWBeZ2C/5A/h8/U0aQnByC
         AyApNnx/EXPMgbv/j6qoyGsoje7F79iQbacsXbOicAAURuuiwhRxrXL15bYNPy8DQSjA
         RmX1lPV/L1y8Es0QdWt8W45hgRbAavOr7PIilX+r2twTJhAc8f9IPrHWsL4ne/OrhLQJ
         JD+ScgBevbVovpWopZzvWCtAQRz+DKcgAvGa1kVzDzkSLYtMbKP7XOf/nXmazi+CRMkv
         JA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005926; x=1795610726;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4QkJBgihenUd1kRurtl3rk0D12BilxuABfR9/a1XNzA=;
        b=AoN4jkhvik50EBbiQdxvEGFPcGUJ0OM0P6vjF7xd9DiyYwZNqFzJ2t887Jni6zZvle
         5Uoe277ld4oCCisRe/4Zwcf71os3YMxp891jYDFQjzQhs+yAekE5YR3jocwcDX1szM3N
         k7YmXWTUG9zOphsXqE9RDz22m26gO7ij2miUGNgya99lFYrgs1PRFBSYVt2iJAn+JI83
         thFMILHpQiJgCfapgT1WBw//dRbSnTXEbUvm7FKPEhNFIcp7Ch7fKq977+iYWXlfjN1o
         2/BwUnImSRFim3fIe18zdb2SEA3U5c6jZQEA+uNE+5MsTMpYh3HAJIGKrqe7Y/Yjxikb
         k/sw==
X-Gm-Message-State: APuU4Z8WzRmcKM4YS+IbNys5MfNe2XMi+cuY+MhdjCb7Pj7udsyfzrnJ
	pv+qYp9sHwbLYflVrFsC/kw6VPPP3GFYhY9Dg/LY7OY+5JDXHudEt6VTQFJ77waxNr9wp4b03ni
	wAgb6KN9WZzEKGCrW6JRtplZ5MHFrmbNTRAr7X/Mh+qitGnBgHu20UWgc4Ye4C5bo
X-Gm-Gg: AYBFou3w/r/BY/CtmMWXPXf0fsoFtQ0LQTll5mBm/DaEjKfIKFQstGteU22pdRm9TCs
	jAFyxDw1DqGTogqwUoyDrx+Jp+AjOtLt5+/UwGc2EDBryBEGnJ6Kyj6KtOiViNVdLNDVzFbymHj
	ykXrGVtD5G5Zq870EdaPOF1N5PeRFGzSKH29ofG3iUFA3+ymvDRU0rKjJL4/+PE6wOwIN9NWXhs
	Br9X2IzfIN3RAIn2MGTBm60vMrLqjbBw2Cob7NLp654+Wgoc6IGuWc8FoweVkFlhy8NmP9W0cqp
	iyHPGWIL62fJldgM5BoAnB2MGpXQaSNK64mkEfKN71f60Rski8hKsmfcTlM/m8RLmfOge9xi+YO
	YxrFy7SoFKcT6WUywSIFKhmkBsVs0W8UpvkrqA3JaBtaaayW86TSwIv9NxGnkUymHajmkRngIXc
	4=
X-Received: by 2002:a05:622a:260b:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d5a5c7032mr35366701cf.37.1795005925793;
        Wed, 18 Nov 2026 04:45:25 -0800 (PST)
X-Received: by 2002:a05:622a:260b:b0:55d:2e93:ffad with SMTP id d75a77b69052e-55d5a5c7032mr35365881cf.37.1795005925114;
        Wed, 18 Nov 2026 04:45:25 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609389dsm4503187f8f.37.2026.11.18.04.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:45:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:19 +0100
Subject: [PATCH] gpio: shared-proxy: propagate -ENOTSUPP from .set_config()
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
Message-Id: <20261118-gpio-shared-proxy-enotsupp-v1-1-39d3fe4d3aa7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN6d/WoC/x3MQQqDQAwAwK9Izg2YtZbVr5QeRFPNZTckKhbx7
 y49zmVOcDZhh746wXgXl5wK6FHBuAxpZpSpGEIdXkQUcVbJ6MtgPKFaPn7IKa++qSKPMXbts6X
 Q1FACNf7K8c/fn+u6AXoRsl9sAAAA
X-Change-ID: 20261118-gpio-shared-proxy-enotsupp-ec8895451230
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, Igor Velkov <iav@iav.lv>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1656;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hi66f2izXtApj9fcw43zOj5fy/xiu3jVifOULfMATJI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/Z3j5vWHTjcDCAtR2fInCMUz2sGI8LOkwlX4C
 KACHOk72luJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav2d4wAKCRAFnS7L/zaE
 w0lUD/9uyYrHDQKWqIuvJ7H4Nj7Uy47Pwd45DNmNUgYPpj8YKU2gX8nivJHyiAZ3hOZVAUcec+d
 +V1W0C629dVleJs0VswlTZJS324cjI98I7ydI/wGZ9NXZrPwx0xOxZOV81lS0dg1dqVYy0pdq/m
 UKv0rnmRA2Cb92y9KbN3mUAaAwS0ZJmhOH5Pchc0Ih/6CyXLA0PO8qNjfkQ66G6RDaaj7ildBhJ
 F7lZKI7at1fCMkTxyO/GM2YOtceanakrSSq8TSVZV9jpXyqtDy7CVkF3Hki48JUmhWXJooi5ptl
 0vVUpGteNE8MTs/G0Lwq9M00Y5VVK5tGUjenUCDVZ0RuOHJI9zJRmm8zWfaQDK6hmYx6BF+GFBL
 4mVf3/CFHuC3VgHDwq1inYvZUBzFUItKTAkjgFMiKpMfawjlpPVLlCaB/Qi1MvepPwJYZ6Q0eDN
 7qBKSy5vnfEFMiAp/EiEkrX7NF7sgCG8dWPobV0Eq74r6zh4jND7mPBde2DvOqB/1orWCL5tJl6
 CVuO/J9jWcJA1ygUETap/NKbhjIN58BGPWNdkrQQ1aKoRxfAplQJiVJ5GqT8jlRT+3C6RYXawZR
 TNtuIxlvaiQ4aYUOhBSx7vqTHDltIOFO4iTnF5iS22tD/gaRBAtw8EAbAB6eYdlkBtVx12l+gcf
 SRMpCB17zCh31Qg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MCBTYWx0ZWRfX7OpEtFYLNQY0
 BvCH/8QAJpWDlzmSmNsg5BKmrVfw3y3ytAzlVwdOCxtmfVRy+xCDAqvi/9sOQ7N/2bFzXub4Mei
 ks77RHAh/gP80/JBY2CqoOgA4dfCe3OSURVO09wf+iFmgui5mX86vehNlSJlczUJTBeVUc8zxM0
 P5QjSdos5iXHmkz5vBsVC47gwTydppp3qtSWPquxwdXA+zmYwBwcvhbQ5Tq6UxszZkEzgDwEFCm
 bBcksza08rf5v6P6P4oET5R3aiyxX0o+XQghIURvJ8i/oICh4x0h76Vf/fJC9CUmmstqFjDhz8w
 F6JQPh+A54gLzt8C3didJENf3W+2UIqeE72feekdBf7Gf6MsgP0IdQmi6+rikcgWAVrIKT4yEqg
 EACFn459/7VJsAVDb0QVJOfHEwgqGfEYOsYFWuIKet63IA+r3hQQCmlLs6/VBDz+6oTV92l7pnb
 YrkhONt1u+G3eeSbVkQ==
X-Proofpoint-GUID: 7Ay7JOUos9qFPWQh5X4Uovyf7gDG0l90
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MCBTYWx0ZWRfX2cFEaRhnxtk/
 1GVdMce/sLVSWPX/6ZyOqbMgm6X6apz5/Kimc7mc/MlCZbfeJ1CXsx0f06wtJFjBankt8uKtCKl
 OkRM8KQ4DQqaSuZALt4p8Y6pB0t9tuM=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd9de7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BhcNr7YcH8cnyUyuE0oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7Ay7JOUos9qFPWQh5X4Uovyf7gDG0l90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180050

The gpio-shared-proxy driver does not propagate -ENOTSUPP returned from
the set_config() callback by real GPIO drivers controlling the shared
GPIOs. This can lead to a situation where for an open-drain, shared GPIO,
we take the emulation path on request - ending up setting the direction
to input for the initial user - and then fail to allow simulated output
direction for the second user if the driver in question does not
support using "real" open-drain.

Propagate all errors from the underlying .set_config() call in
gpio_shared_proxy_set_config().

Reported-by: Igor Velkov <iav@iav.lv>
Closes: https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/
Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Tested-by: Igor Velkov <iav@iav.lv>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index cb593192076fc0bfb53a66e5753ae3ed8d2fb47f..8197ebb5f9a2deb20477037d8c7b07847f1157d5 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -186,7 +186,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 	}
 
 	ret = gpiod_set_config(desc, cfg);
-	if (ret && ret != -ENOTSUPP)
+	if (ret)
 		return ret;
 
 	shared_desc->cfg = cfg;

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-gpio-shared-proxy-enotsupp-ec8895451230

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

