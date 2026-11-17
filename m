Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903747;
	b=j3juULB+HJQvAWF+qKqxG6HuEfS/F5pH1l/EJQfMULKu1biIVyMUzb4RyXU4imRpA93R
	 2UBBN+pOlrHIWfO/8c4V6G3pq6/QPhKEKmQdICgZdfweurDpVQUS36MZl14TPHriOEKkY
	 Qr2tA1UZ/Gi+ixb1/vxe4q+GuMRGfC9xxPIwg6eGWldrdWg8fKrbB+wFDmyoUfM2nfqq0
	 nXt+LtV0kI2fed6etSFGa9CVGLvoz1Lp5tUwMhQ0v9aJtC+nLVyMFOK/nvU2BNUW+clK7
	 GtmTDygtJE2OSVJBWnDTiVnXouXJgBW3BcL9NVtzbY9I+UR546vmPGxlLAivCHK7KeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903747;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RmNkdeA3iaOmTvOGQWtMMNwg+cZVdtXMVdHr7lmQXNw=;
	b=hm8Zi/ipGghxlJrJc9t6j1/NkqOjaIHiFV4OOAh1dSTslOKluP11eyGhYiQNCgIvDd1F
	 CL724XdPV0bncguw3XlEWnrhLkCeKq+MgW2Yk0rTjNYcKXfYvEU4GisfT2lnnCMeo0EQS
	 KDnOhxvDNBt5Ca51I5nbuFLVui+z9dO7dYs5aV0XsdFgmJ6gKmA/72ZeqbAMn/AtMiKFj
	 0Lnum5orW8KlneDeFCEtVyhrdzYSdocxtH5jAVWtI1dP1gsbzb4FzQsankYvJKy49Frfd
	 XPkPYI/OpHUfAOOWcquprFm/puFlvTtd/F+z40pVDK1cFVY0ayYyD9yN/K/O1jEk3mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nP8Al0Fo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 67C2F606A31C;
	Tue, 17 Nov 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nP8Al0Fo
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4CDA81F000C6;
	Tue, 17 Nov 2026 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903747;
	bh=RmNkdeA3iaOmTvOGQWtMMNwg+cZVdtXMVdHr7lmQXNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nP8Al0FoRWTQL88sHDHk2gfmIYb4Yf6ilDFeFjbwuDuziL/5D28fFWeNGHN3uS+ry
	 nDbk1ERU3Fr1aFLbvfMh5+0JnYuxVBsuD5iGPEXNclGt06c8Ufag95pyTwboo9FSZ1
	 fbKy05BCwc9VqktI5e/GpDfxAPl9wgDXbpdFFrltNqTRqzWtSNNA0mrQsO//FOPtfl
	 2CB44KqIAo2Y/P6iAgf/lQ7Z75b3IicT4ZcOVVeuRjWb93SoOb3Tup5ZdokB7lhBOh
	 aPUD6fR8WFPEcgBPKWK5LxGxLs2KLkFuQX8zg16e417Ik4xwD0I8b9ZZhH9i0UQGCo
	 KDOfkhs3ulrGQ==
Date: Tue, 17 Nov 2026 09:22:23 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: linusw@kernel.org, j-keerthy@ti.com, nsekhar@ti.com, 
	prabhakar.csengg@gmail.com, avinashphilip@ti.com, sujithkv@ti.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: davinci: fix probe-time IRQ setup
Message-ID: <henrm6fuymenslgq56yqyiketrv34wmkzjf2oc25e3acn45s7p@2vyoqc4vpgsj>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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
In-Reply-To: <20261109194910.2282454-1-sahaj123.sc@gmail.com>

On Tue, Nov 10, 2026 at 01:19:08AM +0530, Sahaj Chaudhari wrote:
> This series fixes two independent probe-time bugs in the DaVinci GPIO
> driver:
> 
> 1. A file-global MMIO base can be overwritten by overlapping controller
>    probes, causing BINTEN setup to target the wrong controller.
> 2. Per-bank IRQ data is allocated as chained handlers are installed. A
>    later allocation failure can leave handlers pointing to devm-managed
>    data freed during probe unwind.
> 
> The first patch derives BINTEN from the current controller's mapped bank.
> The second allocates all IRQ data before installing any handlers.
> 

Hi!

This conflicts with the recent devm_kzalloc_obj() changes, can you
rebase and resend please?

Thanks,
Bartosz
