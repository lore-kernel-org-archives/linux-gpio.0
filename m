Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C5U/F/Ll";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fXHjAAxs"
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FFBD6;
	Mon,  4 Dec 2023 00:08:04 -0800 (PST)
Date: Mon, 4 Dec 2023 09:08:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701677282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1O43gu5PaMZy8WHsduQMVxyUn86WTVQVBI1S32LITWU=;
	b=C5U/F/LlO+5RNABUNBkv/Ol0xLQtsE8Xh8aRhQPOotP2REzKiRLOKo16IpYzLZEfryw94r
	92qaOO7nOBbKtsVbFno4nmCI7i+ir49nMvOG6CaAhQI+02fcdNzjGJGAGiJoAWI4yGx4bk
	nw5lQLzzQImfrgCKTtwMLE0erH8EXT7yEk1i0RCJ8lPiqtqO+XcKJsTlEWwNuhQDLqnJTO
	fvNibImQCh16s8aZoD/mpz0tkpAIV8H/Lq5cbsl440uzTP2/lrldHIChZsQ5GAIFWZg1bf
	sjsmtmoSERHT1UsnNrR/1dn0PdEtiuDXJRiS4mqKx5aNT13wXAED3flKWPgPDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701677282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1O43gu5PaMZy8WHsduQMVxyUn86WTVQVBI1S32LITWU=;
	b=fXHjAAxs2tbT0NWE56bKj7ScO4A2dt+QV/Gt00hi2wiJr/tZMqeaJXV2fxqbzwTU0jar7L
	SAZ88CTh1rZJm2Aw==
From: Nam Cao <namcao@linutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Huan Feng <huan.feng@starfivetech.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: starfive: jh7100: ignore disabled device
 tree nodes
Message-ID: <20231204080801.uo8nzeyU@linutronix.de>
References: <fd8bf044799ae50a6291ae150ef87b4f1923cacb.1701422582.git.namcao@linutronix.de>
 <fe4c15dcc3074412326b8dc296b0cbccf79c49bf.1701422582.git.namcao@linutronix.de>
 <CAJM55Z9CooaYqeTuZK0FARKupf_StTSfWBo7ziv4KtGq6pEVaQ@mail.gmail.com>
 <CAJM55Z-yam5RnsztYFSKVGoshLFaUau=rOmArsDsZnLYm3jE+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z-yam5RnsztYFSKVGoshLFaUau=rOmArsDsZnLYm3jE+Q@mail.gmail.com>

On Fri, Dec 01, 2023 at 03:43:04PM +0100, Emil Renner Berthing wrote:
> I just noticed the Allwinner D1 device trees use /omit-if-no-ref/ in front of
> the pin group nodes. I think all current pin group nodes (for the JH7100 at
> least) are used by some peripheral, so if you're removing peripherals from the
> device tree you should be removing the reference too and this scheme should
> work for you.

If I am not mistaken, /omit-if-no-ref/ (and similar stuffs like
/delete-node/ and /delete-property/) is only for compile-time node
removal. It doesn't do anything with device tree overlay.

Best regards,
Nam
