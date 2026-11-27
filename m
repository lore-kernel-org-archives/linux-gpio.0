Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771035;
	b=I4KQYU9ajV9cn4NV+F337D9F4WVYBtoKezk9dlBAbZxQqjoImXLHkm72V1GlhL3TLTdN
	 dDIce/yLW8Mbl12CKD+zWPpzftCX5OMiNxXkT/Iu6MyCvez/wTUNYX0Nq5Tslv9hYhKA0
	 NhL/LWPCVP8b8GIGvB2myVCptYB9BCGzJoZegBYevPxrzxEIvbLyHTkm7tO6ap6k9aq2f
	 n8FOoT3TGA0tQ15X5Rq5JH7DQ3t0+PfCaRnEsMC9RQFZwz45xoKehSLsPNcEFw9x6bbnZ
	 DVrdahGFgrESgFcmNnAxi1X+AaY2nwIoMK1kGa2OfCReAdwWohqDfiHAKt2rCweFlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
	b=o8l+AbmvJ72sdxgLOGrwaI0+t2u8LBJ8bjyApO9nPt5/V4QZTQloHkDySTZT+OCn7yi5
	 MqzNR/+SCpovrteKoxyiH3nBJuOJZ41MhYATXP97Y0+trXYm+qAotdN4zqzm8RBLmUI29
	 WSFka3XeIBh5YFFkQ2e1NGOm1ThUq42yLIUB2p1cAUBTdJxELeZO+WRZ7SaEQGueXRbSE
	 s3Zm2jkKDW3EK0KTs75zCMD4sQT+WqSaxBg7NG2Z2QHf7+M/h3Au13EBkfuxk/0f83j13
	 smpTbg8QhrOxmK0TsUPllayd2T8SWjF8wwUdZhrIrCj78A946kAhqfRCkZS7EUDomoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515B8606A329
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iBRw+JF7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4936811f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771034; x=1796375834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=iBRw+JF7XI+FsbMljrWUMpxaiKKpfOzx9BNFr1VLGWhsoqp2VSaP5SWnYO8z1hBxgi
         IQNbBMdeJhsysl+DyR6W0NanRt2DWD8sIglYpY/x5UY1LoWAgPv5ZUnnBfND0YLbUSfl
         Itsk0XaTbtlowa3WI5Gxl3k5nAWrW+1EmwyyX02Xxa/mHvv+dh/iykowrav92nNUb9uO
         Bj83vjke6GeDzVChb/+X4O5URXYdSZf9UGvHEF7bClbXmYZAtIIFShgddgG0GM0/SIrH
         tcAyTh1+lo13Kmdf0MVGZ9iMoPoBNW3igWAXE0c5LOGBN4lH4dIidyqeIIR4bXjt1rJi
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771034; x=1796375834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F15I2fevZFaSQ3g9iMuUelugyCWRoLXcJodfxUxh7tw=;
        b=lERBwlygCclhboZsBhpHcU+UxwJpnHdmME7gMWHYZb0MxfuSE65aiPE4qHt7Y2TVZD
         Q6cZ4EOVop66EMMybwdLqSKp5yb2wNcPQKCfyn062ggUzHe/AB8LqqyWcpC0LMPsw7Do
         x+ZvPoJEvIUNF7QB9gY8/4RWKyyG8abYVkJ2gJwwUdD9131tr7huTM+Ylt3Xj8Hc5w4y
         Lp+VxhoJQNnuOFjcgVobYjKXNyllLUWmaQBswmFitFREzFujCK5FKd1QDoby6DuNJqbn
         zyCU63OlGg7/51j54+JkfQ4Z+IYeG7XtyI0TKSI7ybC0u089GCNZ+c2MRjAnII4l/Bdc
         QAmQ==
X-Forwarded-Encrypted: i=1; AL+hErGRnThVUgAnvR1bU3Uxw5V0Ru25gcaKKo4exqIJH1VfM8dPdOdI27JEdjAvAub3ub0FEDw8ImcWVqwr@vger.kernel.org
X-Gm-Message-State: APuU4Z/vqON6ILhTO0fswPsHUrpfl3jLDE7S0a8CIEqUdIlhj8kLzz8x
	xM6+ek4XWfmP1uUQx3mXVH6EqdC4GcZx7hXm/3slG8YWnUmIHdJBSZh8C5KJ0IKGpP0=
X-Gm-Gg: AZFdTZevznPm8zSbhYPdMCdA5Zq/67e66a+RpLKnjn+wLVkcmNa9A4wu45XBQRV48Zr
	VIH45k8mWDVTmN7uP6e+zqw6dnf9gfVs6TZ1MZ0IISG5LUHF2U1RdWAW9AeQcl8myUXrwJ0yjOQ
	3DAGJ1kpDfdnnsclBClWh6sGXvUDMwdxk26gi4Hvk8qT4VkMKGNdx7XTp/igsLDH7YrMmiUzM+j
	eLtYZQMTF+J/K4T1kX4gMwWEjUoY3GYXXHQWy3ss/3MnkAus7hzBE324KCuEnlxyqy+xMZ5VNa1
	cY3o74XM7K9XX3tDvSVUJ//VVRlGFPZ2cpsDu23Arbds67UzO/59FqLMNqmbgC1myJG3zKbK7Fl
	YQM+Hk3JBQ6qvv6F02d1SCsgfn4l8FBze6jvBWBrGj1z+0mgb+ZoUGXc3mlx4mZsu5kaMFazkyf
	xTH1i936BHkfqXKEjCc6HLuxuM6sEPz+HmYMIT1b4C31HcGbN6kdbAA6Y5n/fnu6jLdRVFwm+SD
	KIBFDs5VJ5SDp3MIXTNYLz7fqWdxYDqxOMihGL+jhkdTVVRPWRSzY9aUY8bYF0JZAygeUogfndK
	7hnCkxPSiEBps85ptqz85lb9q0WYLXTA9hbq
X-Received: by 2002:a05:6000:2f87:b0:4a6:bc53:246b with SMTP id ffacd0b85a97d-4abb5144ebdmr45324253f8f.30.1795771033589;
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm45914055f8f.42.2026.11.27.01.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:13 -0800 (PST)
Message-ID: <bc1ac983-16ba-4165-9827-a7cde032c988@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:11 +0200
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3L support for
 selecting I3C power source
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-6-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> The Renesas RZ/G3L I3C pins can be powered at either 1.8V or 1.2V.  The
> pin controller provides a register to select between these two options.
> On RZ/G3L the I3C signals are multiplexed on the P2 port pins.  Update
> the Renesas RZ/G2L pin controller driver to allow selecting the I3C
> power source on RZ/G3L SoC.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
