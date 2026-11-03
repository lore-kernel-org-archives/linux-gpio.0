Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712862;
	b=sIbvwrna0PqcosB+riuxjJhW8Hn7LIey6Qvc5V74gHN29OJKfiq4oKa8nFRjaDYcJGDk
	 KFImTkS03RX8wqgBG8Z6+1dYHHnh8GEZV5aJoZ4tJPYIUxh9hH6sZ2cmO6+DwCFIKydh7
	 jpasCMEiF1DOeVysiWlGdeASfi4JCT2OkvYLYItxsm0y3wCBxsn0pIj0KGYiW8nRZzkSy
	 hJw+83HzFPyUKaTeCW2lcxrV09gaipgIfon+Xu3RoikTkMQiV3+jYI3pzD2IMoBVixaq/
	 7cJSOlw6Q9r9f+hVChzX3MeupHOOUPQoB8StTFZ4rbNHKG8F+7MXGvD6p0y4pLt8BMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
	b=Vi6F6euqZ/FIxbUyOL07N4OcCPlcpSlvz5q9lVmvFIQTWy+V8va7pioBuHPbsZ698fKK
	 N9osmRuqBKgRosxhFUfzlr0eHSP/5Tdo51PpAKl8na8YeVU9j9cGDe+il6tVFmN8PRzCm
	 aTK3QcuYRNQODaNRdyAz7QLlX/c9xs4prGaH/wp9Ywl7Gd4lDKHesgy9kMrv9Ip7cHPrd
	 RHh72SRuIyr2RwRn/mVKq3KVNJIIVFUqI1e5ZYBqHpPS2LkB94yXVC6hlaDQrqbrtPK7y
	 /SgyZHGPaPae6qqZnZjPDQfHDZxzqI/sJkbg7VWLhkRoXi5f9VFQ/M+TvCbBNw+SJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hEpGkbJ6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F2606A336
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983F2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hEpGkbJ6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClJ4g2546892
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=; b=PaX60grQy2eNFep0
	DO3/PPj54urDEBHx1h8NEYiDFY57Lq8fD8MmHEsFlTANYufLvVHkzSUTCk4EScwK
	Tku3i4Z9MMln/T2hs8xTmb/LZ6w5rpWZ1TRqdwGY0Z74mvFXntUURJaQ44jQs3dY
	52Ymhjr2KHdreS87YmrR+bxRFhXEca1Jy/yVd2FolB/o6mc0s2K07nRXLImQZGN6
	Mt6xSUdmj66I2ALx4D+zOIvSPYbn7h04f+qNfDhfjlCh3Xnv54fPrW04CYHtYKPc
	3+Kyzp6RbKix2u5uwG7hxj8L9iq4BfR8Avf1GjKafw76pJcANkM/PnxBdHqnIEz/
	7xxHNg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3y1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so825843e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712860; x=1794317660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=hEpGkbJ6kpeJ3yie3DJEVvXQz5S4gqxS0wMemAwrdmRgl+pHyEJ3sepjgV57V//cmm
         hWhBQXybiaO4kErrcI7ZnEcoiuymThXIyiHgndvZU9xUaRV2niaf2OEJY/cG5zmBmJDP
         af5/JKN4G0DpdOwJ7M299V3SG38IMeFKfanWASfneWy47Th58rDxf+UkcZHg8mfAYY0R
         QAVGPnaKqNc+BpjsHBKDtwN1v4E6+x25+HI7SIgN74THzSN/WZrxT10vRFYGRs1cMikp
         FdaJsDFGCg/HFyA5LmgAgZvFEN8tPPobOcBz4NB4Ht0rg2T2o/uWs8NoJZgfJYUDWL4s
         tFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712860; x=1794317660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=SKaYfITrutJEajiJw829YcGk+DBz8K6EIjfUuBoEofaRF47Xd3TO7QZICoSsFyGDPm
         LZMhnMBQDvA5h1N7yvDzh8yOC3cjMxhJJXmZhXN55PhmdV/PovEfi0OIrw4B3bBY4IyQ
         zp1qnNOvZi946BEigKqi199qchgvkFF6ZRbKl7bAsIc1GHzZh7g9H+d5X6LYFa7wOmOV
         i5WFkAplj99Hjp+Sbzj4HcRBzKLbzZmaDlTmWIWNQDYBDIE0B6LeQOfMMALAQa5Qudrn
         qGCyybE1C4Vs98CLO7/b3dFhWiilg4EllXZtrjBsTirGoVj0WUfR6pkb5Ji12aDMoSlf
         hDCw==
X-Forwarded-Encrypted: i=1; AKwUvBwPCanj74O1KrTgrIq6xiujE3uYevSCeXMH+8xcZClm1e8KuH4S2NIt9QV+MmfJVqfeGMCQsUCT6rqW@vger.kernel.org
X-Gm-Message-State: APuU4Z8DTn4A/ke45Ap5L0SoTqkojYUgsjrPDlUy8+a5eZ5zaZBHncbM
	JtYqF78ltmA12MCwFTXi2h8JQeaftfGsE5lNpnIk05M8/URtSh6a5HZVOb00YcjR2UPnFWcB1f1
	GJQZO9Lxh2/AHu9GQI/PUv/kFp0ntyiueOaie+u38PZtyXMaa2bfIAZtzbndUxxZc
X-Gm-Gg: AYBFou3p6ERdZXKfHog5phlyyeMACruTnjDpWc20En6ZmqFe/YE/MIQEdytV7FeG3ad
	wk04YXis5K+WA9UB8F9ysGAfCTThJsMVT9hJLB3O7D7/Q24QEw6TQaHX4qcfn1hqHvbVQsLYoat
	KqRJSGiyfstW5lwAptJdMw1kH7WoEfoLAbG2YtxEq7xaI43dEtQ2+tv7KMm0dtjgZy8ric6mVDx
	VtzGCPAr5GxTZ5kqhtLgWsyY75/ZdDgGSHKakI8+wN8Hxhg6li+6UDpQwSRIglrlJGPVNCj3xaf
	Oyrz5M7kygNlJeyfbhV2v2QJmYYh/uGqX0eZ1izixCec2XFZxJMnBuJzZOzqyb4YFvUzvdBGsmA
	P71WZmRHhQIXtEq/YohjKFdG0O/9ymBSS2dvQSF+r2B4VKkqkF5n+J1g+wObNrvU6oBRoQETlH5
	FTXg==
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533217137.18.1793712859609;
        Tue, 03 Nov 2026 05:34:19 -0800 (PST)
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533187137.18.1793712858980;
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:54 +0100
Subject: [PATCH 3/3] drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
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
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-3-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L77EVNO37nJ8bqShHP/VkH28Qj8EpKeHm6Kw3WFdyMI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSAKCGRs/5xWd0LbuvTkv0Yz4BLBG2Wt+fx
 WEuk0Rn70OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w1m7D/oDxRKdjJGFSMRo90SmI08LhWyVliSQHqb9JufJtsRCV3NGcX4zCS+jMU4grEWv0lfuXu4
 6+4yVk6EQyvgJWHhRyWISjQbGRLHjMgBMZ9BZ/aJdVT74Y+OyN1fNWO6Tjwt3hll/O4txb57Cx6
 DOxKARd/3QmK0BGXUEdHAafVAddJBW9ERKPc3rzCjHVamct6gAoJlElxXM1KRmyTGBsYjXQ0Y4Y
 OE40frmKz80lBd7jlFF3Xp2+pS4uL76NuhhpcIQTOYcvixff+ItacRK1syYVL40xIG+SD3FBlh7
 z7t3xJ8ES0U0guj5vwRBpJa2xOFdKe7z4zHQAA7rFtwA0vmgKpPaK+KzlVi7mNLZwStySmisjC0
 wfhKFNv4uuTiaza96qK6pzeg6UC41Ejwfn8y1DbtNuHYebdPLTUQKHNvve5FNAJLr0xkcNErbr5
 ubhpZ9hiOtBdsG2AEXM0C0sryKXmynqccTydaaYRrtaY9xABHDk288XLpglrFrF6Hoe3zBbBrZr
 eLkqDB8W/ZgRR9exnAXnfgO+aURE3oqvdFz4blA8o/dMao86USkCnoxUVDxGxz8EH9Jrlj8CN3H
 zaSMeQ7LI1ZT3IvnNKhc5Pt84Wnc1aYPXV8DqAn4hNaP/e/4fBE7HyaWGDRDPE6KYvHBq29oNHX
 sE7DR92bWXgVLvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -qVNJCoxRGVXPjom09dbl0UjkuJJDoN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX7Qz+GwS22Bon
 PzoGyF2fvi+8qB0hQ9j6m3Y4caa0SfdkM2XMDPm/0wC/FsVHChQamQMJ1Qljs0fv6SVohMEKZDO
 wfAOfQrBo30MztFYQHS5LRiSzdZy4TqAk8ag9QAcfQuN1XDP6vaC7WDH/jWttvdgkSATpUJpUoO
 gMeTAoAWMWxiNTYGoeNqjFwtWzUJs/+bJk6OxmZ0Pp6ehNlHi2WxNF0mbGEmygkQ/2uO3v0kWZ9
 p0vQEMgPr+IsV1mHhfhg2TpMKtqYdY+hwV1a1FnZHqPTMCfINhfrhw+Sm5StGxpF+7oeD6gJr2i
 J1ATHxJIBoqJ4blFghWLuDZAgXgGi/h/djRv2BqpZi5qdR5cPbNGV8ngzmWOMPIbKvhWvpj+O+b
 v5rsT8RyyWdLIuEksEx9d+vwlpk1nuUjnUoJFjKhztaCUKM8x0VHHdVd3RUX+GoYNCbMOXq7R8w
 Fan8sGByBMzplpbDFrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX4Ah4rDKnVJek
 u6BBUAfjl7zJP/2ppr5iSao2vKVzV5XrQyaUlii3/j1iDvyeOcRBlMAOzjoSI0nna8Is3cETH7W
 iWpBo4csgGoWY0Rj0dg8E7eiyUlmaAo=
X-Proofpoint-GUID: -qVNJCoxRGVXPjom09dbl0UjkuJJDoN9
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e2dc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Mb4fkPDSjR1CXLPVujoA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and will be removed. The
preferred way of sharing of GPIO pins is relying on the GPIO shared
proxy provided by GPIOLIB. There are only two users of this driver in
upstream DT sources and both now select HAVE_SHARED_GPIOS so we can
safely drop the non-exclusive acquisition of dc-gpios.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 60cd65cae41d8d4f4f6e5fbc57d5d34058ca4d38..6f09b723cd7c352b0a1ea9f11a2e58052978cf0d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -418,8 +418,7 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbi->reset))
 		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
-	/* Multiple panels can share the "dc" GPIO, but only if they are on the same SPI bus! */
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 

-- 
2.47.3

