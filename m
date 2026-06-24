Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D693DD519
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322846; cv=none; b=etUNcujHS5RpYROHNxcIMmJM9bswe7eieoYaBKCNoYoAtKcO1Qio+74jGIFjqE+kMlgayENqRi6CQR+ryJv4p+4qBniinyYoIF8UHYU1Tdys4fbs3LmmuDt7Lt3CRTemycoKs1cT3Z2K7nl3nJbRiwT9YnmJVNeGeMmY4QptV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322846; c=relaxed/simple;
	bh=4iBGhDDSHqZ+Mwxsv0iYq08HSlDCNFmzz9fmYMnPveg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz6tGZ82WTSYe9rkgX6Q9vhZgvSMZgrExLa83UecY1lhSXx10bBtu8NhoC0fsnNY5VihAQK19QjvdLO9gj1VVviP1vHelAm+NPAKpKbVEwbx/JxmPaxj+O8VVGeAMw00F/4+ir8sz8ZiaS1ntkyf607//SmPamcJc3ZyaVTY/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=d0kzN5ve; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="d0kzN5ve"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B6C7D40E01B4;
	Wed, 24 Jun 2026 17:40:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dHsD4fHUck6X; Wed, 24 Jun 2026 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782322832; bh=TRIs1UF00Za2/7DWm0DzXMlouHLCJMOnJOcyKRki8v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0kzN5vewdVLMlX9FK3wB6VfRdU8zdfJL1KT8VR1w2hJdehTJiyP+YnMwqSvR08lH
	 3cc98WIUsIA/0PcvMAMIdSOD8iQ7UiVkO+C0z4JCOlpN9aLwCNiVT9XnDDHt4AV/bk
	 HCgPd9ex8JiDOM7bfExvWbkp+U4ibSogQqrpGnm5ViELtYPekHg4PmRu/1PK2ssc/I
	 vpJd5D6scNJxjmz5FzkHd+vzOncz8XQapOED2QlRi23mkJqZKthsU0H+bIWxxLD8qa
	 3lJHMZh0l4s2zIcE98MxJE16zMjRTfaf/SqyBDSU+EFY90i6WT6EbPDsqkmYHSkOYU
	 0Ckqvhq3qM/MDHLHSgjbIfIxGBO+UIsAutvYA1qca/I5YjyrUGbB556w3G7LaNkMVx
	 E0opwgqd+Uz0aZG+9kFuZyHYfbMF3MNx3me3JcP5djW2c1QUZZLQWsALBcHBQ1FNrf
	 U3NXH6XmMPjYIhR+XTrMMJDR56oLKa5wgiGywXAgg0o039EHt2EHuE242vtA2iM21l
	 5BRb2IjP/HhawtTKvZbnFgLmHNlaWiGpTKUZvt23jaEqDmc0losccKycjA05kmp9FB
	 0Xm6cVqVg9movYnMxvju75/SafIwdsfCIHeIrZ08km8ElmvqVaZPHs16HBTtcFEZbE
	 1Fe8y+29v4eyqnoUxFc+2xxU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2ACAC40E0140;
	Wed, 24 Jun 2026 17:40:20 +0000 (UTC)
Date: Wed, 24 Jun 2026 10:40:18 -0700
From: Borislav Petkov <bp@alien8.de>
To: fffsqian@163.com
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	hpa@zytor.com, Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>,
	linux-gpio@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH 1/1] x86/vm86: fix vm86 struct leak on copy_from_user()
 failure
Message-ID: <20260624174018.GFajwWgi4c57jE1NmM@fat_crate.local>
References: <20260624092629.271618-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624092629.271618-1-fffsqian@163.com>

On Wed, Jun 24, 2026 at 05:26:29PM +0800, fffsqian@163.com wrote:
> diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
> index b4c1cabc7a4b..cde077f2c97e 100644
> --- a/arch/x86/kernel/vm86_32.c
> +++ b/arch/x86/kernel/vm86_32.c
> @@ -202,7 +202,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
>  	struct vm86 *vm86 = tsk->thread.vm86;
>  	struct kernel_vm86_regs vm86regs;
>  	struct pt_regs *regs = current_pt_regs();
> -	unsigned long err = 0;
> +	bool newly_allocated = false;

What for?

Take a look at kfree()'s implementation.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
