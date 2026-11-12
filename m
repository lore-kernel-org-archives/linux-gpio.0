Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480718;
	b=y6DzE13QWBXhcziev7TA4nL2yInZmSIqqhiFOFgYBtec1HwUceCQVnVgQeLFv7oLK6j/
	 XkSBDNfTvx0kB7akU7jzm8B3wfUjYK3oXQhCHln27DhgQBUROxcwpYOK2eL2CKJcV7esN
	 p6NfYF+t9Jk9JbPmveL5WYBsQPfgs/J9u6IU/q9OnHtpSTFY0KVFKKGW7l+WxTduc736h
	 7h6QED553uTZHKOY3Vy9cBLQYoFS5EKXx38dT8wkwkTWXi5HioIhd6lKlHZNHVnZaTnEt
	 NBImYI6B3+niEBa5UO3d07k3bJTZHZkRO0jbGndiFhv30cQ+WRck/fbx90XqkqnJS5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480718;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F72hsCaULLYrmd2a/Pme1pCs1LHaLc4DVD8ljR6heBQ=;
	b=eN5oCoz8xDk1GoqbfbF9fTYILNeSyaI6s8kIUua0UY0wNcLfRSycCxcQ/smcR3m5cZzq
	 ceSCEz6MfjDwYbZFaCsMoMPpW6pxyiVopRZ6AoD9b0kWs92B4OEg32u22jQlJvZA1C3VP
	 tKoLYvPCg5/783bu3TwPLwK3QbVzz5IwZodOQowaZRCPaF5Bm2wpeSa2Xwqfm3cAaEDhM
	 8m9t/6wX/f0Henr+l8tw6PrXM4SVwnbXeIUZqccjedZooIO6RG26Nks8z6F6Ebs0uo4NT
	 jGViZd8DTPUUrtcC+XJf4VNVLwEH7KE2mYfZ9Gx2u/YC8+qiIhHUM63NtGGegBG5/GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XVl/782w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB1606A33A;
	Thu, 12 Nov 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVl/782w
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794480718;
	b=HcxF1a9bceILuZsCvpnXvraDQuqWOEydfepXtCg8LQGTb6OxsjLPfKoPwLdbu3U4att7
	 u+Jk6SBEPYBmMv8RPrmCKG4lEaWs/oCzODJkteUx/sS0ZL/9CdnkQhtK/81oeoAgYDNH3
	 2C6YvpRMtHxiaW0zTlHTpbi7+ttkBFw8GEIwz6ZqOv1XK8Fmn0oxcpuVm/xyY3hCIQEK5
	 1qf5cx0JuZCNBgreSqXFv9/ba/3/XqgSUj+GOMSxbvDO9/X5D7oqKMKeFw76ACmrN+fbz
	 4VXZv68Y/pC212AJJZ2G/eBFDQbJwvuGW/6pIenY9TcYLo+wz2s+ZrCPUL9/k1zoYZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794480718;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=F72hsCaULLYrmd2a/Pme1pCs1LHaLc4DVD8ljR6heBQ=;
	b=Tqr1Pt0UkquGJKaA5XKkm5oG1fyLFFlVLYkKivoE6ITvdlXPdHjk+pFOwV9OrAodmOo5
	 cRxkxKADlK1SASZ5iqNGAo1TFLdpwvdoulFeP9xiv55cWqGrZNcFsLhcolgy2SffDRANC
	 WF9URzaPgJCHyxWwuF0BF/ODaZXnAcwmCHBRNSR7VnUE6AzEJ8Nsh3uSYctAZomlDlGYk
	 9ucX/PXcfeV6c6dkxe41B7wbQbc0wtY/r3mMMZij/7mrVrZhFBvbw2BTwWNP/yyVJ4ksG
	 yy5T6IeBOKPS4e7bNWOqCkVpV5QpoxcGS0fThiQST/z/JObcts/oRzdfKc8oiXqQ0BA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A612F1F00A08;
	Thu, 12 Nov 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480718;
	bh=F72hsCaULLYrmd2a/Pme1pCs1LHaLc4DVD8ljR6heBQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XVl/782w129MBqEPyoQE6cuVdUnVvhMUbwKyqcUqPA6ACVKESzlodjCQlOSNqyX22
	 c/wLqIRxkRO+w7Zsu1uwLgFGW1GMu9vyepQxItv9QHp4gQS0eIs1sS9UuiI5Ac8SL9
	 N1ksm6AmjQ3yt5RMMehlFB6+gFJ2bygp+aEXPiyJwh8JJbSfBqNSV7QUc3BBVbQyKT
	 /0ToRvwcCVITOJN7t3iYf3tks01NH3oMjxHu7vuLqPwr5EdNlA3jjL/TK+Bk510MZd
	 T2XwzkwEE/0h17H31j8Vze5elAKJg+w8IBiN5hxLWUYsGDfCsd0gzR5uqD+vkIEErN
	 gImFyugfjZeYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0684B4946D;
	Thu, 12 Nov 2026 10:51:57 +0000 (UTC)
From: Gopi Chandra Sekhar Reddy Kanala via B4 Relay <devnull+gopi.kanala.oss.qualcomm.com@kernel.org>
Date: Thu, 12 Nov 2026 16:21:52 +0530
Subject: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: Force runtime suspend on
 system sleep
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
Message-Id: <20261112-lpass-lpi-system-sleep-v1-1-438cb997e0e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEea9WoC/x2MwQqDMBAFf0X23AWzFUV/pfQQ46suqA1ZkYr47
 w1eBuYwc5IhKYy64qSEXU2/axb3KChMfh3BOmQnKaV2zgnP0ZtlKtthGxa2GYjclKEaRJ6t70E
 5jgkf/d3j1/u6/gOt74poAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794480716; l=2044;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=r/tFuO/5R18QV2K9UWmjTQhhmd3Z+jAD2SllVJ2gGl0=;
 b=gsp1pUcbb9f+clFVSqhF1YyjgD91zk0Us6GKlPmhWdWpT6bQ+oi2FnrohhJXEFNs7iCtESbJI
 Bw5A2sV/IMgALvfTRs+s0IgXc9AA7UyO6cvNzgYQfI1E6Hok2hNwUPB
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Endpoint-Received: by B4 Relay for gopi.kanala@oss.qualcomm.com/default
 with auth_id=1499
X-Original-From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Reply-To: gopi.kanala@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

The LPASS LPI pin controller votes for the LPASS HW_MACRO and HW_DCODEC
clocks through pm_clk and only implements runtime PM callbacks. Its
consumers, such as the SoundWire controllers, keep it runtime active
through their device links. If a consumer is active when system suspend
starts, or is resumed during it, the runtime PM usage count the PM core
holds from the prepare phase keeps the pin controller from runtime
suspending, and both clock votes are held for the whole suspend. On
Glymur CRD this keeps CX and DDR from collapsing in s2idle.

Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
system sleep callbacks so the clocks are always released at system
suspend. Consumers are suspended before their suppliers, so the pin
controller goes down after them and comes back before them.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
Tested on Glymur CRD with next-20261110. When s2idle is entered right
after playback, the LPI clock votes are now released during suspend,
after the SoundWire controllers, and restored before them on resume.
Playback works after resume.
---
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index bc7889c993d0..e33d4360c094 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -220,6 +220,7 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
 static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261112-lpass-lpi-system-sleep-70c4d2239abe

Best regards,
-- 
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>


