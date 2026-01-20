Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567442EEC5
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913565; cv=none; b=MWeGuu93pPffg/1nrk8vNDQVp3nPgwB2/FBffoSgNdhcz6rdfddq5GOMQMIVUty59CCxXwxXcjeZRolWLSWyqZskkgHIvjSPDEAxeViW6vXZVfgBx3OH+wV1iARYYt3HmhK34LmKs3u0KGYrKfEKBoT625xALfq9N7z0mzGHWOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913565; c=relaxed/simple;
	bh=tzkYK4R3LsxT7YpLjSwoyXH/3Qa5Uwuf0440RYSVm4U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=XMWYMurHc9RYK2q52d7a4TZoWCl1fMxfcMgcb2adpxynwJ2ontsNAkjoy0rmvOa65qKnkbn9H+qMlaSt3+lcVIY/uEdQz0qr5ocBEQoupUKtbC/Ts1IW4tCdTNsbGW0Mmb5z1+cLtGzHP8o6poC/ywjc5ki2M4M9DM5XW4NgTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trentalancia.com; spf=pass smtp.mailfrom=trentalancia.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=WC2t/1U5; arc=none smtp.client-ip=62.149.155.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trentalancia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trentalancia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="WC2t/1U5"
Received: from [192.168.43.2] ([93.35.34.173])
	by Aruba SMTP with ESMTPSA
	id iBDovNy48iuHAiBDpvJxHT; Tue, 20 Jan 2026 13:52:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768913558; bh=tzkYK4R3LsxT7YpLjSwoyXH/3Qa5Uwuf0440RYSVm4U=;
	h=Subject:From:To:Date:Content-Type:Mime-Version;
	b=WC2t/1U52vwtfzQQkO5HrJmCS1bmdJxgaYYLnKb+WLa6fC/o+ZcnwPtdx1HBnnTZQ
	 V2L+U1NB09QsByYOop9unpBJO2gAjL3+hbMYgo78/bYx+nJhPpW4zqJomX2zd6MoAS
	 JbpkZE71wB7fkjDiAGNQn/6TIJTHQt5fU8oo98siekJ1/tCdxKZ8L2+zWouz13agCS
	 zdgIMc7i8gSUaYHdZLRsxebKVaATj/8tsQ5/KNn52cERR0pJbi8+3Oa6hb85LdiSNd
	 FnqV8/40V15wg7Nh2d4/pCQ43HGh0JU7XXrsBLqW7ZEwIYcNXE1JWXmz/sbEGPtEa2
	 CMadH398JIWZA==
Message-ID: <1768913556.5518.15.camel@trentalancia.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Add Alder Lake-P documentation
From: Guido Trentalancia <guido@trentalancia.com>
To: Raag Jadav <raag.jadav@intel.com>, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, linusw@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Tue, 20 Jan 2026 13:52:36 +0100
In-Reply-To: <20260120110042.1021199-1-raag.jadav@intel.com>
References: <20260120110042.1021199-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE/hFUQL4Jy4Kpr7HIsfw2BYvCIeCRVLQLygetN9pejH3Mhvr5ic//yEJ0o0ZMMs0ndAkn31H1QkAHP1tmrRbVInwuy/Ah5rQ52hN4oy40sUiHjH3KQS
 1fsRIVifNPn16XIp8xVuQAr9mIBQkcu1VbJnEn1/OwJuaoom9nOir+kVEpqc5Ah8THAbWetvjcQTG9XtqTbtYwVxufK1Ze0O8MNvksOwEJ4HqhxOH2O0fUFJ
 gU0tib7CpB0nPfTcr4Ij8T20tMdCsV+xXpUJLrhMM69I2W9qetIoGdy8ck9FGedhmq6DVnDig2ETdhBTnIGDmSfb2pxjosz2l5VtGZEFfL//I1cwHnzgKB3l
 sYwWBToRN5CalkHPzUEF424g56yl+OLmPvBBk4m1ox9n11Fi2eVe2RiwhTT5U1astrumTpkgUG1jTCiWmBXtMcA0KRH/uw==

Someone erroneously marked the bug as CLOSED INVALID, while only the
proposed resolution was INVALID and not the bug itself.

This patch solves the issue because it informs the user on the correct
driver to choose for Alder Lake-P.

Acked-by: Guido Trentalancia <guido@trentalancia.com>

On Tue, 20/01/2026 at 16.30 +0530, Raag Jadav wrote:
> Intel Alder Lake-P PCH reuses pinctrl IP from Tiger Lake-LP. Add user
> friendly documentation for it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0e793a4e2834 ("pinctrl: tigerlake: Add Alder Lake-P ACPI ID")
> Reported-by: Guido Trentalancia <guido@trentalancia.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220056
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/pinctrl/intel/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/Kconfig
> b/drivers/pinctrl/intel/Kconfig
> index e4dc9ba899bd..045651fde31f 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -160,7 +160,9 @@ config PINCTRL_TIGERLAKE
>  	select PINCTRL_INTEL
>  	help
>  	  This pinctrl driver provides an interface that allows
> configuring
> -	  of Intel Tiger Lake PCH pins and using them as GPIOs.
> +	  PCH pins of the following platforms and using them as
> GPIOs.
> +	  - Tiger Lake
> +	  - Alder Lake-P
>  
>  source "drivers/pinctrl/intel/Kconfig.tng"
>  endmenu
