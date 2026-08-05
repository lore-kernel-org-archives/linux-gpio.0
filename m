Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7439479B
	for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2026 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909332; cv=none; b=hOaYgJuHUS5wIkBpTeKu9+bUHOYoCdPSinsxZQcaPf4RwzCNnaZrr6+aH8Q6LZFMjos5R9VVM8hjhfA2tj7IucZcyyoAIvzYgusTCuNJYSCui0kvvBWEWyko47j2UK9dwGZXB3dnTt2Hjz4PikqZq6FgMRPMvQV/hFVp2PnqlO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909332; c=relaxed/simple;
	bh=Xo9+x6jUqzvj9sH0HnpcSbJESgdflkOcrCDg7d7bZH8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGAHO/SYShCXnteuUNBItYPMxVQn6CBbdqLM7imyGVMg8C5qOzxAjomxjMcITFvkEd11hK98ddG/bxPzNBDew3EVs6utDwca+EYbfrIVhhZPdnnv6Q1zs6MwHcszKE2PLv7QptLaQGO9VF2Utav+VGDFE46m2ES1d1OuuRCIp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPizkqcy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPizkqcy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485ef63b68so883588b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909330; x=1786514130; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=32ce7GF3uMnuBRaAE9t/ilBF3E/E8296yhmgOgkyAkU=;
        b=UPizkqcy7cyRNYgcMHAYL4O9n/YfA4zQAay0R6OK4o7x9m3N59H9WOEt7OyTUhG8G2
         BrNs4QNjc6Q3zzfq5VSwstxjNHdL5Tcj7EfhIJoQfdrew5XmeOh42eXahykL2SCHCspl
         0BVbA4xI52Y6Mwj9yEZtpNajb7nfvkuHRZn7NZNZwZqR9vwLnINcboPS5r5JPhe/nWm8
         F/WLyIdci4Y2KZMlYKEO/Ugf9uun5j8YTsJVbaa7gr7+jQatZlqMNg6HcR2ZCJ2XEiJN
         rXyDsB3dn/87g+niUfupSE3UXCNct5qkCNWoCKYVJq5oX9FqmXnUDdwGfDAnWBB2P32Q
         +j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909330; x=1786514130;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=32ce7GF3uMnuBRaAE9t/ilBF3E/E8296yhmgOgkyAkU=;
        b=lurHjrwSyaA5Vzw3dftSKaoW5VAFq+s9x9zd1r6UDDwoAxtrSchIKqMQTQJN7aitJS
         xE0Hn4KnI/qsNE7wYCTG8lLVPnLu5r7phtzShqBORQVMXfHD+uq8oyqFMMkPWszRXpIi
         D2fl/KNcsPGtCYlhCHXfLnwXtelWd8Impp2nwInqshp1taX0zSk8QiFbknQelowOSqSM
         O36WL5gLsY4OPxAt1LcYWU2b0EIDrskpsn81KSBWtb94VnHi6LVGXTvfvfKwl9WVV3+t
         vc7mBKgQps6m9Cq1tpMynmOllmsjYgXvt2baom8Ys58ozNUNjuhhUwrnkY5LdiQdZdC5
         MzAg==
X-Gm-Message-State: AOJu0YwO4HQ1LNyLsfY4uEfQbDGASRaIEUny+LGQWKdokEX6ejwlY80q
	J3eUJfTWVReFsc09CEt2qSi44i+KgXvjvycQYxa57f7jhcyYN5YLTM5Z
X-Gm-Gg: AR+sD12bBPa7b2Awb7Wd3f/RWwFuzY+a58LE0A5Ila4LZlOYA+xYtqgbRFtiqWGNSHX
	lvI86swjaYH1/uHdO2vG8ATWgnl4ICo7RDR07dT6s6K1B6IBaKzUNEiJMz9/uS4OXbzJTw9j1j7
	JYC6GQhoIp2Vanth+dAYWLNUR35h6DpevnR3ZOSeedsjxWLHejG+zLvLwo48ERrfyqkoBbENr6C
	z8eaMBB0+Yld5/LVynLmJU29c6lr4JK3CXN9gNoB40nnEDCArtVMQzx9zCktbQA5UfvaH/e/vqV
	goTSJysZv0Z8dM9O5o51uQ/tHjlgUZV5UJG7UlL5kEP2/gHwQnkMmS2m/e4m0eRJ6Ce/M4hBBTA
	6Pc1Rr8MFdLgue73tsRAyCNERpC/BmJf1/G9tdvoA/KhihnatmpkqCqBg1FSnjyVnH/JRnXP4/8
	rXN6Q5IOha4K4JUTaXCczLy9SPUNt5e5DJuDwdNcjyJhWlACGWuN7iJnwJRALjyh18l2hOVouPz
	rka2TAUj3wmSLqz7YiXpSG5RLbJ
X-Received: by 2002:a05:6a21:7007:b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3cb85ffca47mr5705220637.35.1785909329966;
        Tue, 04 Aug 2026 22:55:29 -0700 (PDT)
Received: from [192.168.20.42] (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm11717163eec.28.2026.08.04.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:55:29 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Subject: [PATCH 0/2] pinctrl: sx150x: IRQ handling updates
Date: Wed, 05 Aug 2026 15:55:14 +1000
Message-Id: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3eIKQ1MDI11j40TTRPOkZCNDE3MloOKCotS0zAqwQdGxtbUAy4k
 7VVgAAAA=
X-Change-ID: 20260805-sx1502-33a5a7bc2147
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

The sx150x driver currently hardcodes the parent IRQ trigger type and
always returns IRQ_HANDLED in its interrupt handler. This can cause
issues when the interrupt line is shared with other devices.

Patch 1 returns IRQ_NONE when no sx150x interrupt is pending.
Patch 2 parses the interrupt trigger type from firmware instead of
hardcoding it to falling edge.

---
Tsz Shan Chan (2):
      pinctrl: sx150x: Return IRQ_NONE if no pending irq
      pinctrl: sx150x: get parent IRQ trigger type from firmware

 drivers/pinctrl/pinctrl-sx150x.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)
---
base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
change-id: 20260805-sx1502-33a5a7bc2147

Best regards,
-- 
Tsz Shan Chan <tchan@jacques.com.au>

