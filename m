Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096068;
	b=fGtb1Z2iQafsVGEq8B3SeBOxeCCKXo6I9wUorNp+eBEjbiGFxcaqyFhqTbK6OPjXW/Vg
	 Ggxc1T4EaseeVTmr047oCZEAiStj25t7kR3sjeE9HO8oszXEoCekfDF3UjHHZCop4d6O1
	 FNHALZ1GRdYshfQQWodoAKBIZgyXVoaWgIkGRHGvLSgf1BfCNP1/+zQ8Qc3BbxZsd1f40
	 nJm9VEqmG6fMw4YmY9pufi6MWo05lBgCvKOThCoYqG/D70Jw2LrcaHaigzJODzaARihBd
	 EDwe3UqKVvpamxTthuQ8RoiCUXVB+UFsYLS8Be5dBffvNBrPs61JJZlizCXTbmtB1QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096068;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/aUkR2dZtbFzFdTxiIcu8jaum48sVObo0flYILxu/V8=;
	b=lPemvpvauTMaBm6+Uj3C5quyTbm1WYqxsm76MMaR9tUpmYHlK7FZzBcIvcKRGwevR8+7
	 7JbIOZ+Dmc7qo/jNjg1Wqf0M5Tn0jU6ICFRPIIuuWfiSTBCRxV8dqc6Zvy1TuQ+ge9Dr9
	 ZM1mvOeWX85wpU4J1nhMHVkZP0WZzNH4rj2rAXQFrIWcYmUxJozMMSoxMobMcI9L2gZAI
	 RO3YsYjYnfMSy/3fTaVv4ubthqzMuOTZEKUeScrJsx4jD2edFUWo212LvLNCAFttOeT5N
	 sYXWZWKkw5qqS4oExAMnXzfaFkwqTxNQZSKMMUeXscYKP/5KIVZehdP39mDazJrTCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ed8chs7W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 470CE606A336;
	Thu, 19 Nov 2026 13:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ed8chs7W
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0908C1F000CF;
	Thu, 19 Nov 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096067;
	bh=/aUkR2dZtbFzFdTxiIcu8jaum48sVObo0flYILxu/V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ed8chs7WaJt8q6FQslIocScqdEwLnMEhjIx8ewmFiCjgE2EP06utqiIHU4wtGkB6n
	 4U0k8+sTi01VtzUmpxUZcxdtdYtI4lhoe9gz0+7BuejhwrlCdFYq8YuzxThgOlQFnx
	 lzlMJsvIFpPzqGirTmEqPUj3OZZ3uomwZYDiO+0ZDihK7S7Ae+aYPTBCDMXMsRgu3W
	 ISdwYbaFEFRw9GjOMGLonNR9SmIYvz3FB1lnv9FMWmHmwt8Yub/jrgqokAN3skuwU6
	 dmE5NClPdYarXRP47ucWwGB9kIT7RxXrmbO+ZZI8mtyWBBIFEtI8aepz98jGlIZfeP
	 hw7cuVbhkdA6g==
Date: Thu, 19 Nov 2026 14:47:44 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on
 arm32
Message-ID: <ehikivdig5q4hvfdb76p2l6xtw5dlyhhvxfj5sfhjlj4btc27r@ickrtvtsi4ui>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-5-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:13AM +0800, Karl Chan wrote:
> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the pinctrl driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---

This doesn't apply on top of current linux-next.

Bart
