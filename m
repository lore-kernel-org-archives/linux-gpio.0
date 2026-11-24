Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531288;
	b=YyEDzw9UvwgJW5kfLJGsPFaWgGzHLcTGL+/8hSem/VKAiqgFApFgu5mJS5WcWTnZtCMb
	 iNU98C76YL93KO+cbQWFb/oBD7GqlhcaoOtduUTkhnKsqUTa3nDpE5lw1eMJlzbkzYr86
	 1SanpoV0iyZTSii5Ms3lld3DCqo+2hUkDc2tmcNV+qmTxI8BzlIL2tuTlEikqxylLPjVr
	 Krp2mghcjAJsUs+mYzjkpNzpvvANr45iEy76/6Sue1Sj266fRkP+h443L33WPz26qyqlg
	 uYR8ZFqT7GaFap2zgxk2+iY2lqDpL4SrR4AHyPioW2XF0Dj2YfEdRdqmVWi9MzsdK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
	b=lCLpdo1OWs7k9hWwju0UTnjWeyIgiuxFCBULDcN2oUlZ4eWtd8KdyH9fVJVEGVUl7AD6
	 Efh9YSXTXwRh4WiyPpKOvCUzKMboZmLF6pL7c1Muo6h/eBh+az+ioh5XaYhEVyErCv4Te
	 4sO+JNhUP1uyA0n/okohTPfgp+PlgM+pva7E4xl8yUCuNAqfv3a+bWfUfym0HhyJ7QrzQ
	 eSNJmQnlhQ9hnsIjE39VSz8puz7IAKFNi8AJK424aE0L2BJAQZ1ePFmh3wZt+Z3BNM21S
	 2RF+NkTvv/aTkoLIrcrqnVaXOEgyMF0baW3gV2Sa8fGm/SzuQoPzS2KHN/4f8qMfQyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3goSmAI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2GEcFeQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9A606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF9A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3goSmAI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2GEcFeQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbqqX1776793
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=; b=U3goSmAI+KeeYxCJ
	n4yMkRsXUQG4j/6OI//Tl7ryrJI5nb342/sMxyjrZSCwvx4afORm4NgrNXAZzks/
	RV1Y3i0OtDcEqu8dUC2Q3U2sm7dUkCuU7gTVLfPt8RzrNL/tLNUzSxuROHZm2UVA
	1lQgHyUShBPgj56i2d8/W4vVKCqkodttNy28NpxmAMkd3ZOFVzl26Z4sjuPlaSH7
	ZdItJo/xOVODKoLjCFGB6TqVhGzCYtX7P2XGzNHqOBJhhk3ToBisHUQd08qY6mKP
	sZ+p71cVss8bm0gSNv6tzQSD+ZLoG6aFJI9d0GsCh/E9xAttlyC3qUvU8PGQGntn
	FbQ1UQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrcad6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:41:26 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4bfc0b441so61253117b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531286; x=1796136086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
        b=A2GEcFeQIajoLnXrKkaSScnWlLkleXW/JTC6BMdxmek9ICYC5VsZcAVNfYwUrETBwx
         OxEuPnuDidysbPzE8D8oe0cnQ7HCg1ZUnxQThYg5H9MFikJTtUKHpn7lArSnzLUj0lCZ
         owIBHAB4fqDobn/SN0PiG5AQdSauEBe2RFy9MW7UTKNr538u4zFSNu/OwhJjDQvGRTJS
         c1sjUIAbP3NtnkGb6FS6vasOkd8N2pjEPMkSPLku2py7boP+TLmpUVhZKQClHAvEH4Qc
         L7GPGXAvW6QJm4+ZKsgiXp+eHK7a9I/wVql4fSY8baxwAB8T78wv+c1jVGGzfwZ0Nl7l
         00Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531286; x=1796136086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMaNu0XBKBvpaweoggrsqRVklH2m30swHb0SwRHlLqU=;
        b=HOCaSasFgqF6SD8TU5dc5YopE1zkJXyQSsHBIwVEdBBWymf1xIkwLnH+O0RARJ0bt7
         AXaYCENTvyaGxxK0Q39+TuzbYH1J5ZoHn7nv5QQOwRKWQXwdzY4cbTpBDl1jDmqL5np5
         9DCIgaBBFTqM/gSXuDCGm/KpiyfdbzTJTlqkUl9Y/0F6R/hg/L/QfVpOzwoeA/9LQpGa
         kSVPCfzV48i9DRC9aRGbkW+29EayfWA23ez+LLw7jV4pfNwbnI9mAKtZ74p4k9byHDBV
         B84YCV8ylWXkz/Z2Y4Yv8MMe9iQJBJIOiEvpCB4WrnHlKjHLGOWR1OdmqvF0cIrXlgQG
         Bvsg==
X-Forwarded-Encrypted: i=1; AL+hErGRM8gyBKEuAxDyys1BlDIqJsvSFrixVl+hMRwOOTbSx+Vaj8xqsfJ/zMzxOKQMovvi2s/qWROcpvCZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/5vWby1bC8qpqyZW/IYHZ0ZSBY/MDaddTc/+jwhxbqLFgoDDna
	tNivsW5U1xU8PWI7H5jkYS8K8njykkRnhLjhwtoIhee/6Nj/Jbw53AP6nSGbnKSe1juawQSAxKk
	Xvb7yTZHGPPMzE6W5omz+JSzQ0PqMR0R7XQ2BKP94SFkVgZmKucxYzMWfiXSrXCCkfagTpZh7
X-Gm-Gg: AZFdTZeSffqqHqvfJEXAz1dlJ5H1eS1nt+u3BgaIkD9PPhMXvxsbEiamupY0f1SDHBa
	yECxkvmVln1AaS2w2iSsKtJb7Cgy0iCVwZ1xiRRlU6N0V1SiUkQ2qncgRauT0BSPmW2i3qzEbdN
	Pm/QvOMoQp+7ShMRpWgzN0YzhLp5FYJOxjgdR6oxHss9+J15DjWJ2cuzBERzi+aXi8KLoP+bh5m
	dHqjCCD2ajzE7gNSDFcWlq+GA4q5rEeAdI3EwZB0O5dTeKDWPXHY+5rdG0EuLLRTH8S6q3mpmLL
	ag6VC34EkSznlyIbcqTTcxHCZc1//kNjy7umiYiKWp5Dp8xZQzJt4UHkWEM2LTBm1zeSCZFRCUg
	kMam2OZwlukX7Q7pNbIMAJeGk5Nt7vFmG/QQI13kkdBQCZOAnwwQ5jNPpeq+PWoWdQxS3eIU2rS
	MuKEubHMQr6HphthdkOlFwj83yNch9uiodY/RFFAGQ566H9ypllUyaU4R25HWSLw==
X-Received: by 2002:a05:690c:6887:b0:8b4:f3a1:aa65 with SMTP id 00721157ae682-8b52043ee35mr56155767b3.23.1795531285885;
        Tue, 24 Nov 2026 06:41:25 -0800 (PST)
X-Received: by 2002:a05:690c:6887:b0:8b4:f3a1:aa65 with SMTP id 00721157ae682-8b52043ee35mr56155657b3.23.1795531285430;
        Tue, 24 Nov 2026 06:41:25 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm28701571f8f.4.2026.11.24.06.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:41:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kent Gibson <warthog618@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Herve Codina <herve.codina@bootlin.com>,
        Jia Jia <physicalmtea@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still requested from user space
Date: Tue, 24 Nov 2026 15:41:22 +0100
Message-ID: <179553128045.30278.93325260808484684.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX/L6RvtIqYYbx
 ycpdKUDqGSAf/FVIS+h2OlfGmbgFN4x4UqoMFsBH8rPSgbumDM3Ht8SoJSw4mzceE+Plc1Wq2Lz
 Xqp4any//nWpBldmZHlyz1T+QR1oyNc=
X-Proofpoint-ORIG-GUID: HBStT9eYCbYUOmJfYk6XSsMDoMhmy5Yg
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05a216 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NrOanRE69mB2D77-yfwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfXwZgSGKGvI0WP
 AlK7LKIppzRPCajgT/ZVOaFv4tQSHfMYO3EELDuWgN7OeA0xVwbQGQaituZooJe42KKcViCJQIE
 kH4PnAdexaSWBLNjonsc5DNQRrzukio2MFNCiewyB0V3zlrGhuZ8RPxbq34lNuojgzVl6HHfjCw
 myWCVP6jh1VTf7iUPSN0e65Z/jiDVZCVcFc/0bxNTsBsUBWDN3qfOzwuVF8nr3kEK9hcx+QTSsu
 GRiUfjb6PMZVfawjZFPA5Mpg+mFBNJfhMiS3qx3ojAGKXiXHmBRPZZePaqKiy2/aeld2M2sKH6q
 76Rebfto8Vjh6GAXtbkPo0Ne6yf+ZOkVMOW8eMPyiCo+tLlVfuI/76EhCNup6E5nk2zSKwT+S7d
 wrU+LKraV1MOhTSA2FJPxbasUWDKKLZi1+tXihaksl/nvHGYZC8VJejQ/4PrwL+fqZZpKMguLqZ
 r14wJl8Dvx0eAEWcy4w==
X-Proofpoint-GUID: HBStT9eYCbYUOmJfYk6XSsMDoMhmy5Yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057


On Tue, 24 Nov 2026 11:20:31 +0200, Adrian Ambrozewicz wrote:
> Removing a GPIO chip while user space holds a line request, as when a
> hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> a blocked read() stall the removal (patch 4). Patch 1 makes
> gpiodev_release() wait for pending label frees; without it,
> cleanup_srcu_struct() can warn, more often with patch 2.
> 
> [...]

Applied, thanks!

[1/8] gpiolib: wait for pending label frees before cleaning up desc_srcu
      https://git.kernel.org/brgl/c/803a7711476580a9ec74dceab90bb3f8ff1b90cd
[2/8] gpiolib: free the label of lines released after their chip was removed
      https://git.kernel.org/brgl/c/1e63be74fad7990efd58e3221de9a060f2d6f53b
[3/8] gpiolib: cdev: do not free line IRQs again after the chip is removed
      https://git.kernel.org/brgl/c/e275c654269a4372b93b67243135cb2e78ba2afb
[4/8] gpiolib: cdev: don't sleep in the SRCU read section in read()
      https://git.kernel.org/brgl/c/1641cbc799d04da692c01d07abc5cae269b62504
[5/8] gpiolib: cdev: don't leak the IRQ name when the chip is removed
      https://git.kernel.org/brgl/c/de364634c5a2aa50505c41cea0d27e2209d3a058
[6/8] gpiolib: cdev: don't report a failed line read as an edge
      https://git.kernel.org/brgl/c/6a59150a97aa414efca1acf77800647ce9921735
[7/8] gpiolib: let the character device free its IRQs first on chip removal
      https://git.kernel.org/brgl/c/8fe46885e513cbf6127694f12a39f3e4ff4a6ea2
[8/8] gpiolib: remove the shared GPIO proxies before freeing the remaining IRQs
      https://git.kernel.org/brgl/c/88f18f606f18796851674af74c286e55159618ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
