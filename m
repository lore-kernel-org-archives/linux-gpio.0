Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013290;
	b=cgp2hmUsF3xehJ3axiCn85xS6das16ENF/VHPEyTHchxTwDzCkahcwQkOtFRmuAxy+Kh
	 78aBP3PKI4P/gkEzb++masFoHGarYcUut3Z/Wil3VuqncxlBC5cpA2uFiRj3Kh7Wsa28n
	 +yDSKtEc6f0zI1v/vbFMHjNxYKokmcysOMHGR+gT4lJGHul5e7cc4RJ2q/fqvUxuiGMIT
	 81JycNuDFURtcjgX4HQ+QvooP+DztXEOAarzW+/PBFEncf+EFChElHLNCVKbot45i3MDx
	 AUjKdTwjVNspPR+X4K3BNFtIoQXu68+NMjrmLFxXxdxfK7kAENgRrR+nPlcRjRBAyww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013290;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=gzRNEGh1T75zQlSlRR/9g8M4VpiwgPqk4EePch59KBo=;
	b=jAOhD+XgmfbEwyz7IpTFMQF/9DNDDn4NRM6hr8ujI4As3PyqdA8ahazdkV1+86uu+AIv
	 zzeUekkoDqt8ynZE6eI3u9KVuZ46Ze2WJY7K8upKL6BY2X/D34w+FO3ex91I9knUzyGMK
	 5wzNNE247DC4M0BPGvHcRdbCaGXfJaMm0IXtt71mnjWBOmO9cbfMp9xcKcVSO4XjLtrH5
	 WC8qMw19BYrt2s3I3eXz3J0ujl2RRCdjvavGV8aAfn+xi8RASlI85ysXHwyaCQXyIJDcf
	 fqYxm7aztceQKR+MFPdelbUEp/eHOe2yrReY6kmtmg5o81SBelulYKoxgaluqSG6bLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGAhsHTt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id D7C67606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGAhsHTt
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D7AC71F000C4;
	Wed, 18 Nov 2026 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013290;
	bh=gzRNEGh1T75zQlSlRR/9g8M4VpiwgPqk4EePch59KBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGAhsHTtzlIinrWGO762CTd6MeoqptMCj251ACvio8LctpblPKaDnv+MJrqEyxhYH
	 +e8DgvEfiYVIElGKNdoHvCvzBB4nuIwxyOSPtfLWHb6OUU8plDsGENaaj0SqMy+rV3
	 geTfFpYsc2zbFHJgrlVWQ1UwR7wVus2krRr8o8O1W1IVkLbzHtAKKylxTLbdDKSDuf
	 vmskJZ+iZq4L9k+OS6SHARZlad18+tVC4O7iIlXQ1AdjZSjxaJSe5rq3Xh6ZOmpo8t
	 zVGdxjVFW8QwefqC4hFN5fIo7Jn4DcKD4lVHLmSsRimAmuUsRg0pHHOs7sxZVXcsRy
	 EG1dUw/sKfxYw==
Date: Wed, 18 Nov 2026 15:48:04 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Guy Morand <guy.morand@bytesatwork.ch>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	mariagarcia7293@gmail.com
Subject: Re: gpio: pca953x: TCA6418 support and driver design
Message-ID: <knel65hfjbq3j4trrtrkdwg5brf4mu6md4fzudtkrf2mznqrnp@6nitoipqu7k5>
References: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>

On Wed, Nov 18, 2026 at 01:25:35PM +0100, Guy Morand wrote:
> Hi Linus, Bartosz, Maria,
> 
> We have been testing the TCA6418 support added to gpio-pca953x by the
> following patch:
> https://lore.kernel.org/all/20250703205740.45385-3-mariagarcia7293@gmail.com/
> 
> On our board, using a 6.18-based NXP linux-imx kernel, the following command
> does not toggle the requested GPIO as expected:
> gpioset -c /dev/gpiochip4 -t 10ms,10ms,0 0=0
> 
> While investigating, we found several issues in the TCA6418 support:
> * The driver uses the PCA-style i2c auto-increment which is not documented
> in the TCA6418 datasheet, leading to corrupted registers.
> * Input-status registers are not marked volatile, so reads can return stale
> cached values.
> * The bulk get/set paths do not reverse the bit order of the first GPIO
> bank, so they can read or update the wrong line.
> * Interrupt handling is incomplete: the generic IRQ path does not configure
> the TCA6418’s interrupt-enable and edge-selection registers or handle its
> status and acknowledgement registers.
> 
> I have spent some time trying to fix the integration, but the TCA6418 seems
> to require several chip-specific operations.
> Before this support was added, we used an out-of-tree TCA6418 driver that
> worked well for our use case.
> 
> I think the current support needs to be fixed, but I’m unsure whether it
> would be preferable to add the necessary chip-specific operations to
> gpio-pca953x or replace its TCA6418 support with a dedicated driver based on
> our existing one.
> 
> I’m not familiar with the subsystem’s design preferences. Which approach
> would you prefer?
>

It really depends on how much model-specific operations there are. If
every callback needs a completely different implementation for TCA6418
then clearly, a separate driver is the way to go. Just make sure it
doesn't break the ABI for OF systems.

Bart
