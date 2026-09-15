Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7847A86E
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513239; cv=none; b=uRiZcg3BXgcUHZsUBz4ASJDuDen5gxLiKPXz5zbNXFC0dFIH6qEIQstFjrRUfvHh1oC0OWgiOYw3hB1eH10GsntKz2jnz1EiQAUDoiHT0r4jp9aULNazAD+b/x+8gBBwIf2D0P05sGg2HXfo3D3D1BUsLSVVA+/pgAT2R6quqdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513239; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKVOh+y4zRhacrgEc/N5Vt1z5xbhIKiW8I1C4JVghHfQ61w8B30Zkf65xDJzk0nbDxnQOrhtGZxGSD92MC2IxL4vMKWdd40nJCaO0emxpdKhLMjVmUuA/zP1EB0q8JngX8EFjKcYQWLjZFPcPNhVOyTZqAEQQNFIby00M8k9AX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R+H+VDsW; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R+H+VDsW"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so243447e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 16:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789513234; x=1790118034; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=R+H+VDsWWPwwdISpuVamOqVqL6Z3bxEgwm8DntMpxcCTXSi7xmnixwFVek0vAGoG/n
         P9iQf6jUu/uRQjGp8qnuEGojIFHYWbHCEzyRA8qvMuMTPZGu6FoGbrnP+z0qDVDK/eaD
         hGDWL3OUSik2Hsi3rKue0/pbXvaw/jhHPoF9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789513234; x=1790118034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=bORSIMQHYUtB8z+BJD1pj7tWcICtXCi7tQs7uPZIbFA2L4npRBotjVDxtJuKMJRKQy
         fRajykqlzuTcIOrx/iElUULpvm/ODbkVsfUdi1txL2sPMZnHuWXaSCULa1S58lbPdhCQ
         MPrOK6R4hhu6W2gNwYV7ckwFL6BSzCeiieqpF7R7CC40s6PGF0rugtbnvJctQz6da7IU
         z0afCvV/z5QuF1g39pk374ry25DLEXpD0VyfpQOYsv25/51QS+XsMpk10MvHD52yxtXh
         +GXviBat+ziuga4GnSvYpw45cF8HLldSv41hwNPEvqXeLkZHPwKeGYY7BNTDkMOqywBL
         mPgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo7PW5FwbEflh5g7Zn5dP4MMapYjMIqlhsuLYKJmMlpGddflNqh4TeNTdowzX3Gi7kaFrN2gcpmRJy@vger.kernel.org
X-Gm-Message-State: AFuF++mkvI4uO9vFJv2Icsgh29g2fO3fytBuu4/eeZtnlAAawve7DlbR
	VlklOik0YkKZEZjhcCFeue7cDKGzvMY7NMAhW1+TQcBsGUjfSUQYBQYTJ/OFYZS/bfNdn78IPPS
	as+AJHmmggQ==
X-Gm-Gg: AYBFou3u8HiffS7rdTPOwEOg6doHeu8ESQYmwvEym25DBzmQF+yoyYl2UhmVVi3Xvx8
	ZblsPH4mHyl+Bk+VY6+A18yuS1MAy9SPcm47Z8A6cp7F2n7vc5AcPNjfkXHmDpLZcPY6+Z9nXjY
	xIScvSI+7pW8z847SXaFW13VzSgdze3fML2ctmb97Ymi3WPEWVONBo7oNiC76V2IIWyZEutRoAO
	AA8K01ryRlyvd/ZmZn+97YCDeSTfIMl2tFGUEezQoXcB7dLvHDYYVgAPVd2Q6vtLYkedN2cD38U
	9vKTXmm1rreW0i3+/8TL/hsrv1gOixTQ7gvex3xXFFmrutozBa0w/aQKJgfw8BZSLg/sEBWORAl
	IbL3exc2BCycoYsj1mVRPy5UnnY/JK5ugkZXaCGRUdQ91ztVDXLIZQw96hCPRBcmXbGAm/1c4cD
	DDAlxwGATCrTHprgIa0U7rYWUHFIZHWCgKw8kqyf1akJOgU+FrhF5EL/RTBoBEda425lvyMcy1Q
	EXVZ7+CdysnLrqnwzHBJsq4MFFUdVvxjrW6Ggq13yMLvRKX
X-Received: by 2002:a05:6512:3f23:b0:5b6:183c:5c9d with SMTP id 2adb3069b0e04-5b8b665eba1mr33405e87.59.1789513234269;
        Tue, 15 Sep 2026 16:00:34 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c35f4sm296257e87.15.2026.09.15.16.00.33
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 16:00:33 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a47f740839so2886981fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 16:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzD+3TkHzneMCY/C/szrkGnnZh8hQ1i4TW/IxqyrdxA+GqvJxixfjIt41eTKtwZUxTaz1QNcovqKCMA@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
