Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795862595;
	b=BCAv5AGWPQxbB19jKiTVX8QhN4Y8YUvwC8MnwmA5KtHmMl/kGvrPaZik/tSRHSWWBjLT
	 xwaZiXjW/GTiqOjOCpYEeCwLoXJhqBGDzcahWRFilouPEjcN295zUFg8mxEBAnbHQbSOZ
	 j9x5hMpPCcD7nttNhXRXBcnG5y6LR5lqG+L9jMkw/7cRn0iTP9+hxCVqdBDbqIjiCrwW1
	 85S4ZuxNplwRK2EMbUDOLCBP32tg+5UhWmPjz0/gCWRbFLamtFn8b1rlloqxN9y2CthUr
	 VYuHuL6nEKUclzAb3vHyKqqEz9qQzvUmguC173zCT47Q6NCXB03PjmvzP1NQRXh/Zjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862595;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=oh2X7OXi4xUavsUn2vl6D/tr54xhkLDdTF6+XPhDnpg=;
	b=VvhTxg3rTdybglZa3+6PuG++QUGHKarpYl3YNL+pRRaj2BjBBBbIZsJjAo9lfUP2nFEr
	 /G1l7SbY4Dlk4MxnuuR2JFBvNQCkENTNQxDRyipJqDtsm07ggg8eN1NzkchEe3dr3bqWq
	 x62exi4z4qmYbg8LpBg1pzo6Ly7XOeP63kx419OzYG2Tc3+w1BC57SpSXH70POV1ZCl2h
	 8+knhl5Gj4MAqoRVcU0V+fRXIfm8hLlUqib9frU7afSm0wIJ3sOQ0mwufmd+/nDTxLYNH
	 QuKY5NHGihg8abKb9PfKbf1Wsb/J95mZWhJ8g+rqwURoQ2xQZaqxKA/vniajpZZ+y2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dbz88UbR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FB606A31C;
	Sat, 28 Nov 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dbz88UbR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795862595;
	b=FcTNSL06QAhiyBfatWRiK7I1e5uywHF8CYG0gLppTaotdE/tBqUWKBV+1XQ/nT43ysOR
	 F+mkMu48vmN3/KezhtzQhQI4X73HT7vuNms2/A7GYDE3ZlwO5D5AlyiBw06vIRIAolTw3
	 2Rmyc1t4ZF4EAVz1sOLZRW8b9JDwGuvFl0WQHgwHpAYH4BqjKq1/Epha/FpcNw4u0NyEK
	 4t6DUzzzr7cNB5HN5kP05ZcIvWP3RmmRTSCzg69xRYt8BIh+nN6LVgp83Rcaxz1eAivZq
	 65b0J25NpG/ju7tL3Lak6vbRKtqrq5Jh+ZaUkrNrRFKo41dL0FQG/26nqVNIGjnUVOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795862595;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=oh2X7OXi4xUavsUn2vl6D/tr54xhkLDdTF6+XPhDnpg=;
	b=brFden7vIdVQw8yqvf7usOBqi1moewmK8L0WZeoxpcp+GR2Bo5gib72nj4aT3Z94H760
	 COGgGm495EJDv0e5U6nuUimwu6WafYA/8FVp+jHnu7ujPDfjKheIcO8tbTtFXdN4bTZxU
	 7ybl27sLiSzh1Bc+2Ix+6rMcu5IW4C8tKSUjT7bB+Zn85n6FfPdg8+yKnFGbY6wqUxZFf
	 +8OlENbZurbJpXI0yC8hhCMQYfb0G4C7edWSwvIagFyIJ6Pqbm6cuiO8vRn5jQzfKx+av
	 yu7Re9c3mW8UHNrROYNZ8vsyqkeAGz3EQKHtpcibJ3h8xU+YQysm1zE8etmuJi/1vHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A27D1F000C1;
	Sat, 28 Nov 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795862595;
	bh=oh2X7OXi4xUavsUn2vl6D/tr54xhkLDdTF6+XPhDnpg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Dbz88UbRswuLvJzCXGJrobettVxF5wyQqzSTCEVgoQWRCP23hehu1NeoVsnZ5rk00
	 Y/gwQlLIhqlhHdvh6ROhweG4g86ZCIYvKw/gHpJedFvm/TjUTcE3WLLLxTkpQ3Vu1P
	 L85JlY7a8HU3jaFzuDQmy++8e6fq2H7tq46r6jA8VaisILStJVrPAZ+pw4KXtG0OeV
	 ZqM74Zdlj3s95DQ1ER0Msi4jWq6MREwoCRMIP2R8aKqUOU8jc5NETE5yqPm2eBJUkg
	 Krz6l2VM7Jq35ySkLR9l6D3vn5pgVjYJsOdpDJ0IhwSYHmtRaWJRqPMPgvQ2jl6dUu
	 CDKTAruJ3XJUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF4594E08D;
	Sat, 28 Nov 2026 10:43:13 +0000 (UTC)
From: Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Subject: [PATCH v5 0/3] Migrate the multiplexer subsystem to fwnode
Date: Sat, 28 Nov 2026 11:43:09 +0100
Message-Id: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23MwYrCMBCA4VcJc+5IkklK09O+xyKSOJM1sLaS7
 lZF+u6LHhaLXn/4/htMUotM0KsbVJnLVMYBeuUbBftDHL4EC0OvwGrb6mA8Hn8vu3weRhaMpvW
 B9hRyZmgUnKrkcnnMPreNgkOZfsZ6fbxnc69vN7NBg8I+ttxZbdl9VOFYy/fmKHD/zPbZtitr0
 aDvsuHOp8AsL5aerA0rS6gxJEohiiFyr9b9W6N1t7IONaZIRFqcSzau7LIsfxhIsYZZAQAA
X-Change-ID: 20260915-mux_fwnode-a16593c39ffd
To: Peter Rosin <peda@lysator.liu.se>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Cameron <jic23@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 xu.yang_2@nxp.com, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Fabio Forni <development@redaril.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=development@redaril.me; h=from:subject:message-id;
 bh=1SuCKJ68UOgHpLyDNKZr0RyJjcgerpccp/GgyvBIesI=;
 b=owGbwMvMwCXWeKho1tqFWemMp9WSGLK5NjhwX3X1zRGa+Zjz/JSbivdu8LzxP7t7nnnTmuczp
 O9+237sT0cpC4MYF4OsmCLLfyejTd1mJka3+iVqYeawMoEMYeDiFICJGGgzMlzTyV2bdfPL+u8v
 zRn+XbyWz5WntsbvnBtH7cGjj/a1rn/F8IdDWFvnoVAlw5J9UttsLx7Vvjct7KNL3o/XDw2Mw75
 IcbMCAA==
X-Developer-Key: i=development@redaril.me; a=openpgp;
 fpr=FF4232B28B363432DA8F187D81C2729AADA16A67
X-Endpoint-Received: by B4 Relay for development@redaril.me/default with
 auth_id=1033
X-Original-From: Fabio Forni <development@redaril.me>
Reply-To: development@redaril.me

This patch migrates the multiplexer subsystem from using the of_*          
family of functions and structs, to the more generic fwnode framework.     
                                                                           
It is a rebase of a single commit[1] contained in a old patch series[2]
submitted by Xu Yang. The original commit plus follow-up comments were
tested on kernel v6.12 on an arm64-based board, but this current rebase
isn't tested yet.                                                  

While at it, a use-after-free bug was fixed in mux_get(), as suggested by
Alvin Šipraga.

v5 is a rebase against most recent master branch, plus a resend, as v4 was
neither acked not nacked.
                                                                           
Link: https://lore.kernel.org/all/20220823195429.1243516-3-xu.yang_2@nxp.com [1]
Link: https://lore.kernel.org/all/20220823195429.1243516-1-xu.yang_2@nxp.com [2]

Signed-off-by: Fabio Forni <development@redaril.me>
---
Changes in v5:
- Rebase against master, up to 7cd8495c0f16 ("Merge tag 'io_uring-7.4-20261127' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux")
- Link to v4: https://lore.kernel.org/r/20261008-mux_fwnode-v4-0-ba3330e44b2a@redaril.me

Changes in v4:
- The patch that fixes the use-after-free bug is applied before converting
  mux to fwnode, so that it can potentially be backported.
- Link to v3: https://lore.kernel.org/r/20260929-mux_fwnode-v3-0-9b3b9ae1334e@redaril.me

Changes in v3:
- Expand documentation of mux_chip_find_by_fwnode().
- Fix use-after-free bug in mux_get().
- Link to v2: https://lore.kernel.org/r/20260916-mux_fwnode-v2-1-58f1d85b9dde@redaril.me

Changes in v2:
- Rename devm_mux_state_get_from_swnode into devm_mux_state_get_from_fwnode
- Link to v1: https://lore.kernel.org/r/20260915-mux_fwnode-v1-1-ed5a6d8202d4@redaril.me

---
Fabio Forni (3):
      mux: Avoid use-after-free of args.np in mux_get()
      mux: convert to use fwnode interface
      mux: Document mux_chip_find_by_fwnode()

 drivers/mux/core.c                    | 135 ++++++++++++++++++++--------------
 drivers/pinctrl/pinctrl-generic-mux.c |   4 +-
 include/linux/mux/consumer.h          |   6 +-
 3 files changed, 87 insertions(+), 58 deletions(-)
---
base-commit: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
change-id: 20260915-mux_fwnode-a16593c39ffd

Best regards,
-- 
Fabio Forni <development@redaril.me>


