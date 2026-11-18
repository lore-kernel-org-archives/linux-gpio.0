Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011129;
	b=qvLj00HKG6y4NDqTDJAl2d9KK89T5V1R7/0Gu3ibxOMbrXUtC/wNO9zPnf0xCflVM6Yq
	 v0Hqad73XZrTdHanyzai+HechRFyx2LXbC6xdWHxUVJ+xHF5iJTxn1m2nH+GLcYX0aSye
	 ik2zDNt+vsZlFGZVG6uaBKtr4h6zsw2SpMLz7B7pmm4LhgmOuL1E33UhtVysgR/Dw9FcG
	 c04180se0Q+VME7W23M89AcCL9v7tywJbmPQutlSXHg07Vlm4FCvETRPXP1xHsS9NGnRu
	 xkZtrVsTnzIcx0frOIFrfrtfzPNm0Ehup0wf8K/EARitBB1xFK6xtc5T5K8DVsjCCTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
	b=M5LGs/XTV3YJny4lB0Wjcneju7DKfTHsCOLZusWcjBayiiZT0c2KhnVQgSkxsREEFnn0
	 AN9AADYo6peIoRpNnQPiBuo1npVPZ7DD0SLk5sPj+etmLbO0COWqqAArUNjKry18iIwwN
	 Nw3TfQZW2rdHmwA+23nm57lNZ5Y35W7WgW30pZU80MDAguv5p2TUovAgtqAOhFXPYbstt
	 gWQ3udlbIGEIK6PhhIwE3memC+RsVPra/acWj2CHyWUAvcvEomT11bhpGl79p9HqrIeMC
	 TT+B+guUbepCf6YyxW9aShrsGtFypc14dvhIhYvIjrxzLd1OZ7B/c/oJqGOEJsM9gJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFA60A2615
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 14:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DFA60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso515200f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795011126; x=1795615926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=X+Du2E5HeDdGwpJtkkybS4mRnYIN76epeyKOe0BAKNzk2aIzSHPLlFW1sPj87xh6QD
         r8+27iMo40fH3/Dfjz/gjFCrVzVzwYvkUZD9TFz9bTM2Tc3FHcMsL2SxK0ysirMwspZ6
         bFZaHoYqXkDu1jjng6iK63CdgKssDdTzOvbzGkeu4BC33Kqb/OL0JZe3/FnqX3w7/Q09
         CoxzHRaFuCZM5DNQ+HEpaMLG+idiYekrYrYyjwysV7ldZqI8eqFfS9p9yDN77C27r4nd
         aQWcGYi1pHhF3PATB+2bvKGeW6ek3lSjSwjVlq1jIHKFJ/2km/fmms3HIkfrJRTOi6Bb
         ot/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011126; x=1795615926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=ZnUHtMFIps1Fs3p9tDLLttG5qHpbQdnnnSJtOrf/lHyH6Pe2nfrnsZ7jKdT4pNVbQT
         hZTF5pg3kiPUUUIqIU6urHcN74Hjhv/Iik6ZEsd599Ypm0uoU0ZJFiekAEw6mp5FOOU2
         2Z9avQFWm9/6494L7SJq7eaBbjbsoOfzp92wpsrVJI5HY7cUuuTMT/W1yvLyE4nBVmBo
         EtqckLS2uq1v9/E6pdodwMQqSCkfO3DfnEiQGtFzS+TW3VZh13voeum5vmXG+EMT1noy
         NP/Kx1DPqhU6Af3KhHIT92O1K+qCPBGV27ZDE1hKCa/cU5aMdUs3Cc1hLxdKyJLqjxC1
         g0ng==
X-Forwarded-Encrypted: i=1; AL+hErFkmH6czbSmqgHGkXN9WPp+GKvXM3W+OTnEtTFgZ/554ivc/QzrD1dyFeS9jOiPCA7h0tZEY5WDLDwv@vger.kernel.org
X-Gm-Message-State: APuU4Z+aWyTMGM+7IeXbtxAVS/teayEQehn1Xs4cse8qwx32i8j6xEHD
	OM2FmDf5mC89f7x7bb9b1bXO02igrLhmjMgRXG60kuioilqXSDLBTgj8gG6LsQsj8x4=
X-Gm-Gg: AZFdTZf8oFRv/YaZGlXIz9MoPZptHLeEPAEB7ZzHhvkoFjftfM4xXgeXnKWCbiydWBy
	hftrKZMpQkcWlMA4ZrqOrZrtFpQxy8mrSBap7WHznAtK0ivQT+6wTrykOiIzaS9YUPKdsaC3r49
	TD2w+exPDaFMtNjGDJdSGLIdkAxlltIuXGSrGKk8Y/uwnadBkafLG6L65DzphxsUYw/aLKNFKaP
	IAa2F3NWPjHHX5Mhhg19yTkOy6fWxERjDbiluguHaQ7ym16zz3eluDWvcV4f2QazIWgH2bVsf4v
	n4JfroQ/fkH+RgKJFYUkrAiY7pCHM2IXLiunlQdKK83b+nT0AlVYlfxBdrRb5TCiuMGmSs2KDuf
	Dh9/SFsLkxcRpwEJ5O1/5aMgobuROZiISZAvKhOcP2f4uF9fkdCcNNwC3pQJePITGWRW6wPaV24
	K4swOW1P5qRwiZhJyZEATKPnTPO0umM2TiztTAN5ZLxYq/8jZhqhvlR2df6p6za4IaIwHM+rZm1
	q6G785wPI4MM/g1JQ5Zy6akDgUBY1Ke/rYLIAxhyotmwtxIJGuy7bs+YCOrXVqbSN/OgDk/Qb0h
	jKhMw1UMRpwJg6x9hZjkS7XSFzzhuqO1bCf9ZFBwhWVVXDw3
X-Received: by 2002:a05:6000:186b:b0:48e:88e2:fe6a with SMTP id ffacd0b85a97d-4a63f4623d2mr6222883f8f.49.1795011126108;
        Wed, 18 Nov 2026 06:12:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5590663f8f.8.2026.11.18.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:05 -0800 (PST)
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
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
Date: Wed, 18 Nov 2026 15:12:02 +0100
Message-Id: <179501112283.639563.5233054429317576626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vlDn3aALOXByZVs7mEqRvuJC3A1ctnxY975yMiaHYv8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/N5nknC99zPPvkMAeEz+LJ/rb3O42SObtqLnBOZNhY
 rKGh3pmRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyv5rhf+pRtSNHwkU+xf62
 3H1MSnpnB/t0htMrxT57Xp29uUlbppLhf/BEnSWNU72uGOXvU9VP+/jowUV9g7UhNjMfXXfY/J3
 3GgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> maintaining its drivers. Jia's listed company email address is
> no longer available.
> 
> Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> Xincheng Zhang from the PCIe maintainer entry.
> 
> Having two maintainers provides continuity for maintenance and
> patch review when either maintainer is unavailable, as suggested
> by Conor Dooley during the UltraRISC maintenance handover.
> 
> Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/
> 
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> ---
> Hi all,
> 
> Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> maintain these drivers. Jia's listed company email address is
> no longer available.

Maintenance is not necessarily tied to an employer.
It would be better if the people removed could Ack the change, and let
the community know they don't plan on being involved anymore.

If they do not reply within a reasonable timeframe (a cycle maybe?) I guess
you can remove them anyway.

That does not prevent you from adding yourself in the meantime.

I suppose this would go through a starfive/riscv tree ?

For the clock:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

