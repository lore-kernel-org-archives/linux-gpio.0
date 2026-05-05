Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FD47F2C4;
	Tue,  5 May 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990915; cv=none; b=qW8yg7dCyv5Lop8DRM4dye7Ug80gl6ND31MiB5a/c5BpgHmHzUBr6w6kr7zZDau2pApuOUEgQk8O0YHump4KiC8NtS7OW8wFZ6acB0gY7W714S4UvfDU8AvU6nmSxMCKnIwDeLMXQOvsYPFOnltfaZsKBdhfrcsMDzhpqij8GuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990915; c=relaxed/simple;
	bh=CgVFwSW21weIdSv7s4FdKSWEJKXyKFOpo7zBPr9xnDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aQXy2YtmxFh4p5tdatTAWLdI3rYtb7iHVb4wirnFnLZl+Ko+DBNehliNChedDwzezR4srSLX4RTTO09AfbmLrOYARoX+PYiUorqaR2PZG0qsmfT96BbdPRYq9Ldssh1iFrbNTqqTihC9ZPSUNK18uSt5pEsR3yNsbHgWuy9AebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUGvJSiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUGvJSiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F876C2BCB4;
	Tue,  5 May 2026 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990915;
	bh=CgVFwSW21weIdSv7s4FdKSWEJKXyKFOpo7zBPr9xnDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUGvJSiLlCU0HvNpUdVW1UH6YTyA7HkOJDtEGgzKKD0YaifM+gjOth33dMqWgioiS
	 6nCGapMyAMCf4Q9zhhHlPuycA20hVIgpaVpgC+2jLXHIb5dfIW6OQtwpy3eMlLK3UP
	 gy4rYsMRREi5IlxByqfK5SPSGogzdZ9P8GLiZXgAmfbr0XSajypSVp5fnzubSuLPLF
	 LIqh0LzppHuOjsLg9QOqFD65QGzyxvPc3JQ6O/ZIyqlJw03ntE6Roy51L9hPpNmjsn
	 v2JxDdfwtkD5aDjRQBA2+v6Inx01Hc8Dkv6pTWoySMPR/t/zNXpAlc3OidNiCP+AKZ
	 m50ia8UgHxjYQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
In-Reply-To: <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
Date: Tue, 05 May 2026 16:21:51 +0200
Message-ID: <87lddyx7gg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gmail.com=
> wrote:
>> As a way to prove that this is indeed the problem,
>> the following workaround makes it work.
>> It just inverts the sorting order of all matches,
>> so it picks Bank0 instead of Bank2.
>
> That's a tricksy bug, I can't exactly see where the issue
> is.
>
> I think to solve this you might need to allocate an external
> irqdomain that deal with the three different gpiochip
> instances when translating the irqs.

struct gpio_chip has this:

        /**
         * @of_node_instance_match:
         *
         * Determine if a chip is the right instance. Must be implemented by
         * any driver using more than one gpio_chip per device tree node.
         * Returns true if gc is the instance indicated by i (which is the
         * first cell in the phandles for GPIO lines and gpio-ranges).
         */
        bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned int i=
);

That driver falls in the category and lacks that callback, no?

Thanks,

        tglx
