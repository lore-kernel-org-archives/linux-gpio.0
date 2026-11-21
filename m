Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276757;
	b=3VO6jnvN1vjm40DlCbqz6tNY0AQI90HSwyZvHPMyQPxi1JSxenoptAFV+Fak6fZLpeBE
	 u1s0yzXmi0sdgEh4k/XkxMDKRQuAGtrGLR03C8uz7Z1H43n5CQiPsu3f1fXt8IbBfzCOh
	 3KnWz9u/GWAmGNRxlABmzD77UfeoJNyuM4dd9xs32+ppx5qJkx6j/Fymk2YA+PjWAJGCy
	 mIjk+8x2tpXyau37QUihzm0zQmq9QsLT3MpHL3zcve8ViPdbEhu9CnIN6vzce8HddN62z
	 B/S70gKw2hHQsuwJCpOrLHoy5cFWP6vSbpDS29cUjyUDGJVRPcqLFhcobl8NgDR68sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276757;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=;
	b=25GifrWQduRieHxKihFXP/BR+puJ4Qi7JttAXi0h6cFdx6VRTL7PbudqS7sBIsksfmXk
	 S1Hp0HyEUYUqC6lWaA+F2WTnRsspaaIftRkBBBtg5CNoXI4QDbObTPS6Q2qwoS7Euc7wL
	 e1GHcm4duroflYST8swERM71QUQF3fTw0qqSi0MZBww2rPYwAGbR0Lnw4wETvOqHIkUd7
	 WEhqHexGi6USIvruM7caUeCM32oDaqdjqPi9Xf9bcVsLRTfwZ+LPqrtUxQy8x5BrLrqp8
	 EFkHeMlR3fTRqD2v3mDqcw+f+EDnSLT4aQP8Cqc8uZVe3htGCvXf6SbA6txYjov6C4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Az4Hnbry;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=kiXtSmVT;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC3606A320
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Az4Hnbry;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=kiXtSmVT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795276755; bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=;
 b=Az4HnbryfiJ9btHy2n5bBt9beotwNzP3QI2tithJndiKZCgxcsZbOhBmo3VSatcdkxzhiWhkc
 +A12542Lck4clpmIWSETH0GTdPzCKPV2uthkDHBmBCwNXBU8kWzGEzm3E4iTbaWGQbRDYuFA16V
 HDlOsukK+WWiBkwtbbWRJL13ofawEk1YCFITVBb4BUySpAJNu0yS1MfW99m+zMXI40IsuckXZeh
 migxsAABkBrbEx7fXmB05I9sEvRY/zSOwes3SK52i5/Q15DJ4ro2Zo7LkkY8kDfEx1P2vpHbyXW
 EeRJVJzdAauWnfH4dUqfcA7WhF1PEKEZw4305KBKVptw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795276755; bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=;
 b=kiXtSmVTzfeG/DTqJNEcPeJUGCiVlt27fIP4ZogxtkhZF8/kifGGevqmOcamhNLAwpnSYJ/XH
 CQMa2biUauUpFc5nZGCVVI8Mjr7c6Y7TL0woxSvRICw2kwYqND2BvCQlmvhFEcN+z+SQrrNB6QR
 OoCjoFrU8wvDVr3ZPV8EuKE=
CFBL-Feedback-ID: 6b01bf98090687713cf33d91:78dc9c7cc38c4dbae0ec3000e8638727
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b01bf98090687713cf33d91
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] pinctrl: rockchip: Fix pull configuration readback on RK3506
Date: Sat, 21 Nov 2026 15:58:09 +0000
Message-ID: <20261121155810.706866-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_get_pull() is missing a RK3506 case and instead returns -EINVAL
for all pins. As a result, the pinconf-pins debugfs file omits the pull
configuration for all pins on RK3506:

  pin 0 (gpio0-0): ..., pin output (1 level)
  pin 1 (gpio0-1): ..., pin output (1 level)
  pin 2 (gpio0-2): ..., pin output (1 level)
  pin 3 (gpio0-3): ..., pin output (0 level)

Add RK3506 to the case that decodes the pull configuration from the
register value to fix pull configuration readback on RK3506.

After this the pinconf-pins debugfs file includes pull configuration:

  pin 0 (gpio0-0): input bias pull up (1 ohms), ..., pin output (1 level)
  pin 1 (gpio0-1): input bias pull down (1 ohms), ..., pin output (1 level)
  pin 2 (gpio0-2): input bias pull up (1 ohms), ..., pin output (1 level)
  pin 3 (gpio0-3): input bias pull down (1 ohms), ..., pin output (0 level)

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Based-on: <20261120201540.672016-1-jonas@kwiboo.se>
---
 drivers/pinctrl/pinctrl-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 97a73f8c4f6e..cad602fa41ae 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3910,6 +3910,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3506:
 	case RK3528:
 	case RK3562:
 	case RK3568:
-- 
2.56.1

