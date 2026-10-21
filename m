Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592652;
	b=NQVuEhVp+jDlgE6cmzETJ5iMKALgpMq4/BHdS9sebeEH++qKrG/3siker0FcBigdsfU8
	 46GfrmzYAI46Wc+DJPA4LSLDZrKBa46OdfcYoI9tRoKFyxkD2qi6UXZe5dF0Iv6CcTEZn
	 vFUMC7Z8KOyVFOkU5F/roiTjasYLzGiVpyPBL/7Ppdp9yy3F993D0o05XbuiO3yd1/gtd
	 w60WuNyAnQfvLR75zaou6EUKHkSzoh5hR8QTISv0s7A5kfqP7KRb/n1Nx+MNWENs+Gmk+
	 6B9GcVXg2B26jrjmek1cbES7lhahYxpfF5ko/UvGULTJ31+/plRyPtIWdCfH/X+WGUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
	b=ozrIPNuzw8h3SMm9HT0+o3KtxxjvmcCkaxYhBmKYYEm3N/sVlh/e2dqAw8pDP3/nXz6m
	 lNkMMMeQAGQhmAN1ub8MB/5PfwLeF//Fh6RyU/jGaLt3CFUCCvsZ0YHslyI7C4NT9d0TC
	 1npk2pTeHaFV6LN3pWp/MzbKIhivCiJo208g+bIavFv+b/zFxTpn8L2Lhoazcsp49hNHB
	 IC51vdnAdWEjRzA8akWsbNO4HanMQKNwtQ2kzwHcIgJXY0AaJseHk0bjEV2y1t33UoA5Z
	 m00yTPfZDP193JmBCTTPTynCYMdEu/T5xCqsvBA/X0LqJsJdh3Zpm8mpwDf5pf6jTHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95CF606A321
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCvjqzBY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SL53nW4D
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF3dw306918
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sbf2G3yrxB/WPvimhAHZox
	oMp/kII+FrDEZzGcm5u+8=; b=HCvjqzBY35z/m/+gpGWlok+0616SZOhmSAwntX
	8p0j+35OBgvq0ZzmYwywD0CST/t/EHNNjCVW+zqgKogjR9kEmePVuomMpKplZYp0
	bWzWZmhN3qx8upZFTisjmnoHSxQxFta8VtiJBAP5asrmqk3wD/jBg0lDEkXEXnbE
	jBB3O72QBJ9vVmY6KmtJGbolEa2PFf6ruSsAO3r61bZd7UNxs9Bjx+hFn2/W+zpN
	/FwuPbYULFkYZL+2ANgfU4QG7VJXpjDsvQz9libolilGynR4go2PssJUexEkQpeP
	MC2dgn8U0vRVv4Rvbov629iyWV1KDRnUJ7/kzIBqpTSjj+9A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0mbux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so168666137.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592650; x=1793197450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=SL53nW4D9sgiVmY3FpfNglwNpC5Q0Q9dGI6szGIQ/1UaD1oknr08K/nj93AuP5hyyH
         0AkvDMnEn1fnUtQwOTvB7SMj6niMTLaXfQQjWdJ05lAO/z8Ct6yW+PltRXC2FScP2GmJ
         hkLMUrnEWb6uKdWC+ouAJ1lgA+jwSG6ubFXv5iMF50fgGEAP+RpuaL0rWKHiLPwl7q3l
         h5s4MFTiX3k7ggHSiKbZ2vfnTYIN34i2V+Wz/rHzMVVEP8MGKoT/ko4Lfc+tRvLoctOD
         kJ7aInYf3kwsbfsI+Bxxvi1koVK5rzX+P7pFHR1fsVstG7+6JV2JLuZtDX8ISAPtgrrC
         hSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592650; x=1793197450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sbf2G3yrxB/WPvimhAHZoxoMp/kII+FrDEZzGcm5u+8=;
        b=coSOszBKHHB0Lrc1BcSdzXtj/fzRIZGaeczXYtourEM99Ri1DANg4ljfNOKeMCOUOh
         kMFMgBJVQQ+5RZSw8qipQc84v/kjf1srJaHGCI8Sg6IpAjw9Z0MkPZymhAfOZuUs0QSA
         j3VGf8Pa/9V0wuYyYae42pApROxR+JzGzFRRCel/snb/NLdrm3OlT/e7LW63X1UJWur/
         +NlSbmlVCqPsalQ/0UfGpeZ3FeTiS4DRRS54HufWXA7vE+C7JzXV8LYRmhLBa9Gg86Fp
         S5+4JB7YiWErlngnP5CqpxHvOuXg0l3odfBMCPftEtVpquHrg1ti2yA1y8cufX/nLT9B
         p22w==
X-Forwarded-Encrypted: i=1; AKwUvBxkTO6do5bZRbP7YxuW9YK90JykK3o41GpkVyAP1I2R64LxUa4mOu+EqGr/JF56yF1TpOVssZcEv3Vc@vger.kernel.org
X-Gm-Message-State: AFq9FYKBjaV548LvfS9Gz7L2u79x3ZK4AMbIygHv3JGvw6640JnCn3lW
	IN7J0n81AfPhzK6pZ7dbIy6ACfgn65tKsGlaUpGKibEv/FW3OoRgwVBqRd6fE/ITFpukHmQCFDt
	NauKpJtF6/h+BX/jv4o4FrWF9QP3cc2we3nzfImtv2vvuetaoJXm2n2cMe7zjFgBr73s9bJH/
X-Gm-Gg: AYBFou1OLIptgzTLBtEBqt7+bMgUIgkBgzymjTduAbLd1igUmO0XODSYL4GlyyjA0Dp
	MwWW1gisAV8VbpVnugOSzOZ7L09jQY6papQUlRIv5pe0n3PoI2GYm3eo0AUMPJ0lxCyRh355S8n
	g9ehyRalFfDZWTPy+aUaRqA0IcONM6/8HW9NEM/K4+gOO0x8/QYyPXUwiN+j5wWzmcqe+ffKJ+g
	tfJnFTGXMb6t/FY4I4jm6dEjDqEjNElcWBVcG1xYmNdKUfDOEu4FO1WOBZVo3k6i4/ZHPjn8R13
	mnMzmuiRiQjC7+nFeKufvhayNXZEPURtigZau9ynallxVHzokWdrW9WL4O0AOBmCEozUeFmr4zp
	W4+MQStygdKM2PPxU6ddhYo4RLBYT
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877608137.15.1792592649517;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
X-Received: by 2002:a05:6102:2c81:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc9263c60dmr877598137.15.1792592649043;
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 21 Oct 2026 16:23:58 +0200
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAP7K2GoC/43NzU7DMAzA8VeZciZTnK+2O/EeiEMWO2vE1pSEF
 dDUdyfbAfVAKy6W/pb8840VypEKO+xuLNMUS0xDDfu0Y753w4l4xNpMCmlFJzt+GmPipXeZkIf
 PISHxc0pv15FTa21wdDRHJFbvx0whfj3sl9fafSwfKX8/Xk1w3/5HnYALbho0ugVAAvecStm/X
 93Zp8tlXwe745P8BUEI2AJlBTunhW2hAeX9CqgWIKgtUFVQG6M8uAZbEVZAvQT1FqgrKKVRDq0
 2Ae0KaBagFFugqWDQTmLwwnTY/AHO8/wDVr3zhg0CAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2584;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1KuafD+EQPH3mdB6XnrkI3RAJydayvPTvSwodVvmMGM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsCe0HAnTl2+WybK4TohjALathuCERDtpeJp
 QQPWJ10H/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLAgAKCRAFnS7L/zaE
 w4spD/4wYvzXkDa/jMjCnPdbV1e8047b6IzaUbYz7M5LwoT1Zl5X3NhkGQLWf4QeV4QH4ccxiT7
 kQu4pQ1iLcUkRh5mxEYpwgMomsSB+8KD8kGCoMB4nCqXJW0luA6OfTQLpGfesC03Shn+2xfb6dQ
 JO5h+Uev+WofgkB1djtM45Ql3z7Ee6oFEkq6574LorpZPeFeXEZC/TPBHbD/e7hdhEyq4W+TI7b
 J3j+Se0hwPotuHK7adh2jQxn/tEDY2RLXL0905Tbi724eS1+RAGTI/NdYugPISIra9HCTBh1WAZ
 gNmubKxrqQLrO3RtvW25JTjIsVIYrTzfDl7wosjl3i4s/+12K06nm5vt0p3ZRl8V8kFxaEsnL6n
 TmEEzVVl5JIJhdUN9NJOimHI8lg6mMHO0TOvvlxHAj0MpPQBzEnQczfKNssRut0TrV9wu5UaA59
 ItEu/0n0iBDLE2sFY5TdIlxnxV+Lpm+QT4eywcxrlB7FHMi73MpHQfQtkz/F+otw0+SKSyfpWKT
 SOIYOwTSLjSYv1QCdizdl3on+18d8RTCIP1aT3DMMjRbBgzU//UTAkcSjI4IKvzz625jfgI3j9I
 a//UiyCQHZYk5Ef/PzUt+kDoRPEPqG3mv3MM52jUJlHiVMOwoolasYv2hZJAB/3FFNYvMwBVFwQ
 FK/G1W84Kv07KBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXyvPlGdROZLrN
 Nw3uQLTCZISVL+FEUw/0J3FX8bz/oFdsjuuzNA9/HZau3n7W7KtPodpz2npZEZtjsDRc1dd9cTP
 JiOBiPJnE8DRSQj7OgwAjuxwbLVRX12GcR/CROppSST5F8nYa8JQB0gBuajfJFf3DTFaHJ4ACXi
 l3j5ztT7BGRJYgtVdAL2GeLqx6uDenY7eiQENrnKUdPVG3tt+wP8nyCQo+dcZ1VeVF0UGg27zYx
 tfFS/BHxgRy5TpXuekvYVyl/yl3Bf7UrpwGydM/YArmU7fSwUviSk2UGjjeeAyc+QEdQv2fKZMt
 apt094DLa+q8IailOXli/vxbWx5iEkp4pksN1DMJbU2/ZePgUekItNHWdZOqPxMups6C2vTz7E4
 BynP7WYt/8o/bXOg0D2utO7ZKMuD3YVlYF2s1PBC0OaNobjmjtH28P1+kGoi3Ci3MptEGqAt6T8
 xR2kdPqDgSR+t9IZgQg==
X-Proofpoint-ORIG-GUID: FIavMIgkCH-KZDGWIx6JCCH0LwOmM16r
X-Proofpoint-GUID: FIavMIgkCH-KZDGWIx6JCCH0LwOmM16r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzkKxyfcdrB/L
 4miLlQCJHingiVp8LRHsSEDs1aPfA9BhUxnMy292yDD0dpMXvgu9tTSIS+X0DdQJGM/jpa13hyq
 dBDkL0hBlneGXNMXqD3W09WM9i+xfSw=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8cb0a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=CwMrYGdqEC8KazAlSEQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 300 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +--
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 181 insertions(+), 154 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

