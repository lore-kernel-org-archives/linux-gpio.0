Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794165624;
	b=IBLXx8aLkW30vbW/qpF/ZyNslKdZAIucmmRf+LVYbanCgzUL4tpKNL3+pKrMu4PLcOTQ
	 41my5qutgT67gwZvFjypf9FSIqkmyGTYw7ehKzF+SBMR8HL3gIm+rYo4FKff9ebbtkG8J
	 L3XF2rhDKt5scRuq30uab6RpFt/nSj/Fq4a77hZ3122hBZcuUBHbasLrj80hCUEz4ePlg
	 6cCZtbrPJVO0fp5tA1fKBH6yv60e6ciwTDLB7TZQxUlmnz8DAi4X29kMZXxiLlrvg03r/
	 r0TXNhsN9GIJqc8sI2r+/fLBixvGBSqhTyloLKc9bqfRfJsPQySF2x/k/qRL7eTJzRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165624;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References;
	bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=;
	b=CQwxA0hjywlG00j8riM5BRsy1J33lPV++1XmUOHSXauS/797Bb5tGpNboudwhx6zhRiu
	 c3Y5GwyEHNq15Kszil8zLFUxCuf7U15jdxpfkmGsOercubeZW2NUcofYnnJV+eGPal9Gd
	 YaZRMf/Y2ZU2wrx96PbRw4Z0RXOZpkjKfSZuYyW0ZHfb0qLwVbRyIc/6RVmCX9Lc8D1D/
	 xVSd1jYNledflwk3nuwIdgH0PvffBdDqFpzrpqJdvox/cNXErj033VS+M5YIfdzh/6/8g
	 j4WPwhK/tjYSpmhPVHG9ZqZ/6JuyVMtisxKX1GRAq6asc9G/Hr+egB6ihn2v7Gh6n6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=AQvmD1Yz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE127606A321;
	Sun,  8 Nov 2026 19:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE127606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=AQvmD1Yz
ARC-Seal: i=1; a=rsa-sha256; t=1794165599; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=H1luY180cpXtbO29I367UMSNTK6y0KyF55ZvVdEna/3s7vvoWRNa7gHyBt/xypqZZMGVuk/EmUAtcvUHPvvAWQR/1veMMrR6PWvpshYeipulwQ+jpW//C7+R5QwUlYj3RD0wLQISLwxIHf96zyiqGdkZJ0JXcdkCXADBJR872f0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794165599; h=Cc:Cc:Date:Date:From:From:In-Reply-To:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=; 
	b=au8oB9kOxtxGgufNSqVsCnUYGolNFTIKo4ZiWBNef9t72FTe4VNMUnBb+pIBI3iQhhAQSFyokmTJELFAp2MAF1HgtJUdAzV2q7zJJNMtUl4ZowfcpI3tKDblRcs3NxoYfLPPyRPdC+1CkkYyniDyRUC/Nep1cL4TUAw8kii+zOw=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=AQvmD1YzyKqMNB5XrsP9jMBdwMKIHBOezeGPp3sqpeiPnayjypwvDzH7sur3GtV1X6v7SR5FPmrMmzjnMigJuSpl6Pgh8B08Fvjq/VZh31AShvhBxrkeWGdkoM2lS/w3nbUwkJBv32S1IY4AQU8omKjuSlNVa/qo7yl4iSylw3U=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Vh/9TrYwU99E4PCgRdKtI1GiSkx+bWoa8oDdIzOoHTQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794165597779665.0347627600589;
	Sun, 8 Nov 2026 20:19:57 +0100 (CET)
Date: Sun, 08 Nov 2026 21:19:56 +0200
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: iav@iav.lv, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jianqun Xu <jay.xu@rock-chips.com>, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: rockchip: restore the bank registers after hibernation
Message-ID: <20261108-re-v2-gpio-rockchip-hib-dbclk@iav.lv>
In-Reply-To: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
References: <20261108-b4-gpio-rockchip-hib-v2-1-27d3d510cb73@iav.lv>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Hi Heiko,

Please hold v2: Sashiko is right about the debounce clock. On ODROID-M1,
after hybrid sleep with a power cut, a line with debounce saw 0/8 edges
and a control line without debounce 8/8 (one run). dbclk_gpio3 and its
parent dbclk_gpio read enable count 1 with the hardware gate closed;
opening both by hand gave 8/8.

With WoL on, aclk_gmac0 and pclk_gmac0 come back the same way and the
network stays down after restore. So this looks wider than GPIO, and
fixing it per driver looks like the wrong level.

Should the Rockchip clock driver write its gates back after restore, as
at91, tegra210 and ti do through clk_restore_context()? I find no
restore_context in drivers/clk/rockchip.

Igor
