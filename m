Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827522;
	b=fL7yuPFYTNeLKcM91gtxd6+Jz2cAcQR6lw6mb1RYyErbaCVSJvNzbTtne+Kk0kS2fdQO
	 Y30mudZVLvcdCzKIb3vQ8XWABqp+weOYCDrmLXQoYItXsNMzDlmyBYYliWfCN1i4cXjUi
	 i0Yaxr1XEEN2rvEYLgWLDoomEeloLbgywi0e+Htl9SIsysSVTLWJfoIhb1ucne54kQi5o
	 Tp/EDS6yyCz/Qqhd9ff7tzBOjXMabm4MRTgI0pWBnKKDhWT3XJjIMbZZoVUGLPn+u3asA
	 TFhtk1slptEylrh49aB7QJGEKb2kzfsCezZuv/EN3pNLkXVqdhPJfXLL2O1WIlokNOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
	b=rgES1ouYBzJocxB03yfqYidmU31mOYDH1owmcava64PRKvAq+S7omtCO1njy7q+kamT8
	 7s4EkQJuG/wg3CSEnykY/8BnhpznOiT6XoiB1EtyzceZbFyLpzJL/ZJv02BWF6Q9mk9Ds
	 sKF0KrMTSLE3MlzIQ7XxqlIQttMTPg8UXeESG68pF50lO1oXYbjjFca4WRVJ7SqRhUWjo
	 x7lVwJj89czK0l5MohBH+kW6wmAUtXYXZQecukFco2omWo9P/2y4yWNbTIUgYAcR643UQ
	 uwGzmRHT+rUthN9/77gSQmwnCn3bWGg9mZDhFebKF2OiDfUWyaeRuaPNXz1HwnRr82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jrxYe0XL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6828606A8BD
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6828606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jrxYe0XL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGB5eKp2093843
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=; b=SPbFwlNgGAX1d2Ij
	jCPyY0ToQkVngHeWoqZbyO2qpTQVxLkBPqXCcL+ytwQaCeKyM2n49b/AWLvyyI3o
	7bTDPQ7MbAi654QDvRyLk/e22au21iYYwdlyo4bu1iDBpUDgvJn9YjDF+KX1dt2g
	k5X5VNeznb4+rjU86YsuRVsVqoXS22M1uF9bQZxDC917oKMtHSq2xtdnr91NXlrY
	zYR7E0MeN8D3UnnuC72ehIIKUugnZz6IhZN9lAdnGvHA+1GshhirfI8F8+etthVS
	UScFIepHQBCRhOxZbbyMy84KdEoMtP70bKIUvEx20ph5UBXxkFHUweHcHxyTb+7q
	B1qp+w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg0mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:12:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2cba05824so2983932137.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827520; x=1795432320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=jrxYe0XLTPeJY75Pc/jTqkkKMSS6XkD0JBsb+lyBDvga50WWaDk4dhxR0WbVW3oV3u
         JL5GqJhY/yWRWqRB1MuzfCIS8RwiP33OkQ67yMkV4AvTg//x4wk1TQnb+/9bJFuUFNn7
         Jw8anFrASNBOQNciU5um6i1D4IoHxFmRlhlO1zRi2tT/ncyHI6M3b+Xm0UB+f5K4IwqH
         z4cOsM6OA3Dp8rQH+L+zPMAEpSRwvdmEIh+txnzQOFxO2LtuO4rBXmooPVx6fDXGR58g
         +ubfn51JnK8A+wYjeK7hxdLQOvF3yjtPVPaqENXPZwZLmEiFldQz5gYEn/ApOlZtWc2b
         oIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827520; x=1795432320;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=vWgyCLXKXs0s0fkSs6KDlE0wO7CSRssNSDODefKcj3s/A5Dr3ZvXdExLXpOTUMHmfR
         jvci6t3DH46hPaqYeGM1Oe8Ih5lt+gsNmW1DGszvRsdKnPrfcsVXMElgzYlRCFmiVWIo
         /fXNBqEeb+LzR7JzVuVPcn8qcYndndoOfgJ5MlAitxUu4c/QwLrLqlAZn9TQnT9ODSvM
         WiqpcNZxNwczRJwo0CgoJJbZ8/+Df05bl8yQM/mmCazOAdR93Sc+RW5iDrLcjrW12oIw
         2pEZSzEbwQxFFPaNXbZlAiEQ0u1a6nk8ksGPqEF19ImmkzPMI5a/zBqI2ZHnpzyP8Jai
         Sq3A==
X-Forwarded-Encrypted: i=1; AL+hErH+4UcnG2XGWezoZ9EhM7fy96X3RCBTlCvIbx1W3wxDUWA9lVtNhvbkvfI1J+13nKcstUtLLC2uSoi5@vger.kernel.org
X-Gm-Message-State: APuU4Z8Br5/hTvCxQpPlX2FnArfS7N4696todSP5KEN+5LuGxot7SSSK
	aVHWAeYH/cyYXHpanfNoLf2ILVpXHs0e8jdhGGyGiClkALLmgrGb3ZMTTM+KPF3nVkrZDBVCtQ6
	Ffapfdox8ZRgALZSnLROmnDFbF30kXh/pWD51wGvpuoVDxrDfC8/SdC7BBpxScF+P
X-Gm-Gg: AYBFou3aaTHNSk8auqveeXUPNw81kkm203SbQdZoSpCOEcctW/hkgcMlgNicyQ2S/wV
	FQLrRttoO4dF9DXUxPFykryYGU1JveBU4pr8/qrWKXnUAUFritoywm52ux/z4N/5eDXDo3voa1m
	+gFaWfQ4Q84QlrIGEdBZpGAhubNp2IqZ1VpBye6xDh8k5AXPURMpROXI1vAf073OmVgjl3Y2RHQ
	R14eRqUTbz2vHW48wfMpXXZEwLwrK7GPTjdCTPfuWvKBwTk9NA/SeLIOXtD6g8ArsN6piVJPjkq
	e3AJ6PmshNhu7dn+JhojpgqQ2T2qE/Vng5V2jiDYGwUTeVwonQVM5c0lHz1IJKSxCu2XXdPCeZa
	wdtCgmR5w3WwUdnJC7+ycnDmNnawTTeuHhMeAeHOBb2h6cMDbpDaiXVrp7BC4v090KHlBOfWP7q
	zrQHGX+BzkYnzBfQ==
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373689137.24.1794827519801;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373677137.24.1794827519145;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
Received: from brgl-qcom.nice.aeroport.fr ([193.57.185.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm390162175e9.4.2026.11.16.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:11:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/5] gpio: shared: replace platform lookup with dummy software nodes
Date: Mon, 16 Nov 2026 12:11:56 +0100
Message-ID: <179482751351.15583.15760848984534388271.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afae500 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=g6/0voG6I3K7UbaExJZWvQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RChOLZm6GgJo1hU3wOUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX64UTTyKd2zYr
 5mVlkANe0fokFpDHNNUdH/5WxbP9L8H2ko5VydRXC8uG3vEaxQdW8oqy7EABsJ0mmOo/ovfRjB4
 SPF7OxFXRLvUDBnm+KXi/Ff6qn3/mQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX1Dbx1qps6U6M
 V9rpn9Q/ry8+wOlGWoc/yj/7lRK15F/PSlx7cWwdm+sj2fXvTXYNEzUPN2ysuM8l45MHeci3frY
 uzL/Zg/UEGVCLUF3y4BfeIjzB0pcAJaeErbWr5DhDTZ4wUmaD0lmTyKmsF5xuCx3+CANKC8vVbf
 uWruCxg1U7QIfp8sQqgL9ezz1HwsM5Jq68h9tYSqRW6XbYqlySaY9ME0G7/9v/5NtHpXA5fin8S
 pshlcvojJPyv36jbbTK6LnBP8bqVBRUkRNBue69jkGSTaroK/udqvg5ObNZ0CZDFUZA10k708QX
 fJs0HqWZkflM/VELBOToK2PVKoA8Ln97JVa+52NP6MSLM3tH2ug0WiFS+xJ1otBZmRyD1RBHWfu
 KUkDr4fk235VLzAFtq1CJj0lRI5TrPKRqVhGWJ1yvYe4gXie0L4CUZ0pxKYEb3keNjgW0E63n/J
 /L5CjL95zu3y9cfhTrw==
X-Proofpoint-ORIG-GUID: ZefJUc3uuXMzpAQg1Z92TpY7csSH_kvl
X-Proofpoint-GUID: ZefJUc3uuXMzpAQg1Z92TpY7csSH_kvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043


On Wed, 04 Nov 2026 11:38:07 +0100, Bartosz Golaszewski wrote:
> Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
> shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
> for shared GPIOs. With the NULL-pointer dereference now fixed, this is
> a rework that implements support for this use-case.
> 
> Sashiko pointed out several issues under v4. Some of them were bogus and
> I fixed the rest.
> 
> [...]

Applied, thanks!

[1/5] gpio: shared: factor out per-entry teardown helper
      https://git.kernel.org/brgl/c/c402fd2961dd013e2da56cf53d147b4943fc3bec
[2/5] gpio: shared: factor out per-entry setup helper
      https://git.kernel.org/brgl/c/cda42ff53c4b57f56f08de6af7abf280d755bd74
[3/5] gpio: shared: unwind partial failures in gpiochip_setup_shared()
      https://git.kernel.org/brgl/c/6067a8ace266c43eb9514288b76d1d07a0f31eb5
[4/5] gpio: shared: detach the proxy device from struct gpio_shared_ref
      https://git.kernel.org/brgl/c/0b80fc5d424d0926841379c1f190a8d1b2ac360b
[5/5] gpio: shared: convert to using software nodes for GPIO shared proxy lookup
      https://git.kernel.org/brgl/c/23cfadf96e14a32a398975d67ce48f1f59abc253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
