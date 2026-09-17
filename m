Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C8B4E4318
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648195; cv=none; b=WHAycsLyBlNFneynIfiWzimCDkaxGjUxa8NqAO5fFY/8a++y7+yGmtxh7Q8FdKnpL7d6WtEgUtwm6w4KtWJtvoEZVKQV9YJaF4bZ5NzbYdKI/KRE487yTTEbCr82HL7uB4UTPl2dVBTuus0scdVqaG+pNzGdUl5HfV4q1mlw+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648195; c=relaxed/simple;
	bh=NiBLOa+Ivz/MGMdtQtUORvBhVtPqCwg0j5rxwwVjFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNfGfrbauQw59tNE3aocNjlxYO4ZokSDijqpMpHDgecQARb0ES/wQrwoTIHmGTXJefm3v+LIk/6sppFMBbhHAP2b6A5ReB6OaGUx99tQ22qS3VDjB2/pVTPmCMfPFsgJeXxTCZEH6YBKHWX0dJz2kFp7XwdEFZdpVXFkguddqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU+5HCb6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU+5HCb6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4647905e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 05:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648180; x=1790252980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=gU+5HCb6NEhmBQLVaLIqnXzYCbuW3y+9zP3j/sbrylZD7lHYyFw9pFNkQiORNKn2+9
         ecpocjM18AVXqhmb2SxpKUeXm8j+Y5YY0eqe95Ju9PSzoqQDNVvagBBBRiHmAyaNxoSO
         yrF2knA4eFqyBkfUVMqfIAaC170alJV/Ke3NfGe5vcT8LsMUz1AkGiyw4nqOt58DrBeH
         edFMUx8EXzNK34fToowfRsGPhAcUCtwcD78tvPUV2sxZL80o7IO0qH+1j5wD8x1fouxk
         3I6nNpgWk3sZfc3RW+iF7VrURE/zt9+KM6ybjY5XT/davL5nsM4B5Uuztt8JxBvsRJbA
         86GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648180; x=1790252980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=NDrOpFilYDSjr4rajkGzs3/MSQQzltVUNHZiGDvLOmeIZGzfdiwvajTEBIFPfUUZjC
         t6Rgk7MEO0KXDBTSFwhsTG3+OUmYazNW+CZqc6VOMCmifphEN+94otjYq+6dCEnnbQBf
         PF9UwVxpqdqoXkLwiE+QTpo74ajzCv+AJnlcNpt9wsWM5Br9IqEYlznUOqkyUs6i8YTH
         Qcc5AoYtG4LGgwa8qF3yHPSFK9iwAZfhsykEjEGkHIHLLEvOJOH1plpE2zDXUiWiNcuA
         a8RDka38ORUepqvUKas3j9sTJ9yXMD6lZet/Q/vloO+Wk/cb0lr/uLwPlyHgW11MGr3W
         xADQ==
X-Forwarded-Encrypted: i=1; AKwUvByg32fmwfkqsfeRrRvLqVLe1gScb0Ip5vwJmS78O31mgcXI/d4YalheCyjfiXM6glSrUcnfjPC7nbPD@vger.kernel.org
X-Gm-Message-State: AFuF++me+QHHhbvDD10HmY1It5oSW4bP/DS3O/HslpPWjUno4p4nNFcK
	F+A+dijI1YKu4sdECoLxvceYCAwDM6lEvUOufNUqfYoBrvcdcocgnLXc
X-Gm-Gg: AYBFou0ip1RG3U7OdVxV4m5Netmo0zbvdX4rRBiZYHvQZJHy7Jg3/H4puBsjgkrqbWv
	e/NFFze+UNvu6DWIQzJrjARCvAp6FRfOFdZH/1O0zyRqYvbWHdPCKeD9M7fJqQEWdhxjRD9BwwJ
	x8Cl4HLMiJYMfM9tF743nEpkg7g+ohN5NnHX5JuAJH+YpP/r6PWhAwisY/WDaFQLCjQEkWEeOYr
	ZCB8A9pAL5H4anXUK+LhSPZ+W0jiCifMneNLy8wAdY1XOhN94nz0dktSm1WTSVfizg5K7uQlONL
	GuZmf27PO+6rMtgen13L2QbiLdcYqfToFocDWNWBrZNTbe102re7H6/KB6G3rfd6jPr+b57QN7Y
	weouwwCx/Z/m+HAttniycTPXLA1JR/P/zfHyV5f5J/Ot8I+aoXWGhIMlQCsW93giodioSgPDwc1
	q8dbqX+3lnMS274c3Fi9v5h7J9gZ338JwB2ypN2POolkkzlB4+8GkFWn/VjpKXZBCzTaBNQh7U4
	unSxcRgJWRawb5EHuDfeypp7994v+T0AJnJ
X-Received: by 2002:a7b:c35a:0:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fbcb70a1bmr64001725e9.9.1789648179633;
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm82621135e9.0.2026.09.17.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:29:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, wine-devel@list.winehq.org,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] file: make struct fd_prepare const and kill its err
 field
Message-ID: <20260917132937.5a15904e@pumpkin>
In-Reply-To: <20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
References: <20260917-work-file-fd_prepare-v1-0-b87534ca49f3@kernel.org>
	<20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 11:09:45 +0200
Christian Brauner <brauner@kernel.org> wrote:

> FD_PREPARE() releases the fd as soon as the file expression fails. The
> fd either holds the descriptor or the error. The separate field is
> redundant. Make fd and file plain members and struct fd_prepare simpler.
> 
> Callers of FD_PREPARE() get a const pointer to the guard. Simplify all
> users as they can now easily access the trivial struct.
> 
...
> @@ -191,35 +175,39 @@ static __always_inline struct fd_prepare __fd_prepare(int fd, struct file *file)
>   * was allocated. If fd_publish() was called the fd and file are
>   * published and cleanup becomes a nop.
>   *
> - * @_fdf: name of struct fd_prepare variable to define
> + * @_fdf: name of the const struct fd_prepare pointer to define
>   * @_fd_flags: flags for get_unused_fd_flags()
>   * @_file_owned: struct file to take ownership of (can be expression)
>   */
> -#define FD_PREPARE(_fdf, _fd_flags, _file_owned)			\
> -	struct fd_prepare _fdf __cleanup(__fd_prepare_cleanup) = ({	\
> +#define __FD_PREPARE(_guard, _fdf, _fd_flags, _file_owned)		\
> +	struct fd_prepare _guard __cleanup(__fd_prepare_cleanup) = ({	\
>  		int __fd = get_unused_fd_flags(_fd_flags);		\
>  		__fd_prepare(__fd, __fd < 0 ? NULL : (_file_owned));	\
> -	})
> +	});								\
> +	const struct fd_prepare *const _fdf = &_guard

Since the struct is only written by its initialiser, can't it just
be 'const' ?

David
