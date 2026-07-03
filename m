Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB2EAC7
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037233; cv=none; b=WsJFia4ICejIWRPkLBJ/u6n4t+taRqwYQ+cZ7ZT6AjRgZETavE6UBDj9oSBYgQiNGIDLXCXW+SfH/aJJFKJvvaVjQyS9W8wHAdbYnNilaZ1ndJD5xNy4hdi+fA2IBB1unm26QMIkfSE+ldr6QkE24an2Nd5fMX4xUojK1EaUm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037233; c=relaxed/simple;
	bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVqdQ9rZCNNw8Ztv+J4MpxUcBaizuLMxXv3/0MCo5tcH/kJZ41b62HM+qF08KMEmU4FLNYNCFd/hozgJEDCz2yBkY75n9HlRotX4tDIcGnVsSK4EH5mWizlIfZa870Wg630GamRWBRBkV4GbdzLA9c1Sj4CLwj3gH3zUIQnMzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSsdANNI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSsdANNI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e663c828dso726285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037231; x=1783642031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=PSsdANNIF4OPI+tfso6z8T4Wo8zFkSdrveTCsBEU5wBd3266P57N1wRjBng7jjaDOr
         X8garHzxlrq3DHFyeiNF3HLtN7ko5eSPRIj5fFu2kq0Mr9K9I2StmfUWD3sdjDli5JHa
         tvaHImwY18yv7CnMKbPKiFhYsrBPHPu289tYRegUKGFbVTn+3vvND8q0+HOuamJjtgq2
         KIMQl4dJrPdsJ3QgRXl0Cu+ZsZ/HSpyQKqzpFV4UuLXK6yDK54FVcUlqeA4CX5w/KS38
         dnY7hPaCgZY839pki7XX1DMt8rOx5EFRUeKYPfPYib6S5mqoxcpc/0WO1DTE9dZFnJaL
         mdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037231; x=1783642031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=bso3SOfRiAIYYp7PqEli14FjI2G/UX/JHj+XBrEnJqayymvscYwKZ3XMsveEQJa6Ck
         1mA1dSpFWW9hgSpq+YOAsykOJWUAKUD1e2GugLT+n8l3q5+dj8o3rGqZEMazYoGVFjZg
         508koD5cwOqXof27YkCYY22azcI7u5VPfvB/6vgRRqqBWJgksRLald/csa4NQpTTgZPL
         PBa5Onlmczf9MMmksH5EL63YIMmN/QWpWVY+OYXUx+Ya0/zqTVST041Zl5JR9CqkCbQf
         CukuRinuyvtTiY809+nSan7KapfrF/trqFdqzXo1JDEAvYDUoi4pcfPofxht5uSItYBi
         8UVw==
X-Forwarded-Encrypted: i=1; AFNElJ92ojta+TAxYQZgNRjfNpf8gTat+EkRRYv/tZ0WcWpPZhmh4LiL9Ya9eqP06gr6gf11jKBMDAvFlNLM@vger.kernel.org
X-Gm-Message-State: AOJu0Yywa3p+g/U1ptPDolm2j914K+1wHpvsEtF/4COunXL++bjVdp9k
	g1vGSkW688J+5eIp+z2PkrXx3TRR5o0E15itOwsxgxmgeiHhiNwYLHXp
X-Gm-Gg: AfdE7cnMqTT0bZ6m6aJs2Dr6JKM2mU95y9UBGBekVuYuCvvzEFwn9VhLHTGPDxfQsWm
	G/hgv9ek6/13Udy7Dikz2p7wyzhri0PP2/tsJ35wdb52D0WsK9+H26YjP5GQ5s3Dvu2m9roB1YX
	KSZbpfskrczIbtCL8/tQ1vwewyz3uMXLG8iwehHgKvwLFQy7mXpYKWDtdTJsO/2iOCcxXMojrVL
	5HTvWt02zZqMUOm6WpztAFU68sYn6M+BBLA1ZkTfqI6FMpfjHYPMK7LVKyuzid5q5AGDj9ecRWO
	3nmmX5ONZpEm6L/pPJ4rmONF5I1PvGzq/YfJfZlLB+4gaJVPiShrzgruocFv7+nFin8aK8lxI0P
	xIMP5ZBoQOr0lQkKKr8zpQTgbNtpY5fXzSduEk8B1qwasHespe7eQ2UqZ3a9+wtXvuO/xj6908B
	yJBf9dvRmE77P+E50U3+CUTfmKIT10Gm6j713qv8HImUFn+W/h640npSv2XHpK
X-Received: by 2002:a05:620a:4044:b0:92e:650f:c392 with SMTP id af79cd13be357-92e8b275355mr264263485a.17.1783037231297;
        Thu, 02 Jul 2026 17:07:11 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbd6c9sm12190085a.33.2026.07.02.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:07:10 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Yangtao Li <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu,  2 Jul 2026 20:07:08 -0400
Message-ID: <20260703000708.1238530-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

In case it helps when you next spin this series: these patches have
been part of my local A733 boot stack on a Radxa Cubie A7S for a
while now. UART console, MMC, LEDs and USB all sit on top of them
here and I have seen no problems attributable to the pinctrl driver.
Happy to turn around tests on real hardware whenever a v2 shows up,
or to run anything specific in the meantime.

Testing here is AI-assisted (Claude Code).

Thanks,
Enzo
