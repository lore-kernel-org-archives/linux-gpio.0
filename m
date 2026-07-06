Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8542643A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340572; cv=pass; b=JmHw+XfTjLjLHcwGtDxPbgqBpeJBKIF1nTab16yrT4kWIL+NTN1v5XVegZCuhxB+IRCmZdaY9inqEUZISqsAbDy1MaYNpwIZx6e7Gunn3ypy5NyfhgAIxZ6hSqE6E5fYqWIXGf/2Esrcznx0CaXNKuyup67Yba5HnzV4aAU1kUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340572; c=relaxed/simple;
	bh=fNdsVvPoYtfMK+p+Bwdtbyf5UKKWeCT5KqAvqfNQ37g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pr2ZdxIzvlu0gmd0zmrMqqYpHYnUYbhyJFJtIHDN+NDsB58ywsFDcbPix88YlHEpwTNZUg2WN76ISFdqEFR4hgbbT0KSg+gP/oqAl8HBn3I0m66bXUf/1ay1eUbQHketIcT8SogGPO2wq9ArKbnxmztYmZmYlGaFNQfJoUtsRC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXy+ZCj4; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXy+ZCj4"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2085638a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 05:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783340570; cv=none;
        d=google.com; s=arc-20260327;
        b=nTVs5/MYBCS3kt4p7x0e0r/X+2RcJaEosfpDc2iUcHce9zccTZNEHYDVtBrLJqunqF
         ui+/qRvLToO6ShF/xN9vxflquRWZ/OcDFWW5fkeEbuQwbn0Ns6QYFqeqZc+UF2ynaoWU
         +uXhCvWC20QTE6Xv4Y/ASz267HPUcjbUy3o6NTfvmesNkTF1s13YY/gcsCqK+h7FDD+y
         YUNa4iyh0nARFdAQBxk4ubi6PqiGq0zbDpdMhK9i65xdAtygFWTvGUj9WpQOGV7a/bdn
         5KFasWPju5iY8Y4q1trCHlPjfcnQrUqb2XKe3crFfhO6w0pu1Unu8HsoFcI6cXmpGhz0
         I+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64SAkZFlLWnAyqINmz5UIgUSN27efBkefIrfjT/2tHc=;
        fh=a1E8ggIxeJsv4N0LIly72kOj/YCK7VG5MvCEqKKetAE=;
        b=VAEHPrQTD6LxEF5CaZsxTX10C0GD349BUCFgZEGV2i6g74NivaFvNYPGtZZTxys9GL
         P0nB7Aw8M651ym728z4OLcCttsk5nJzsP91oo0HtmisbuigXXmpRbjorHcK6az8FoZza
         7siXBk32RkOqfcAtqM8vlUCfsiz6iY6VGnTIZda3IX7lxKvi6k/AXIJhfA1Uqcck3NyM
         jJ9gxm08dhxH/Y1FVXP5BLVg7bjigy2HDzD2zo570DU9cPHr2rUvihAvrzrNNOZc0u0n
         5vBKYiJw1dvSFtJtgmu1u7INBRLgxzJTmxx2DBOtEzsK5bSnTEpX925g0FY7LmNaPczB
         izbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783340570; x=1783945370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64SAkZFlLWnAyqINmz5UIgUSN27efBkefIrfjT/2tHc=;
        b=aXy+ZCj48qYqZhzzxGlTDtkvANT7nTzFdtuFxQ022kJFpLHSN0d256KrqCRRrRfKGu
         A96+vRpCmzkIByzBOTjxIay02hIxnE8IHr6TJM5NcJoMTYdjkx9d1UtvbtQTO+1fuJY/
         jkltgoTug2yueYuhCIe5kDgXeZqBZ9HLoz2ZH4UujIYk1HI2/8VYOoKj4mrd8sQMmxeF
         of0knaVtgljYEc4V6o+yXacrXJY4PXFOdy4gc3K72Z2c8/X5E8P0KWHnVFAcWWZ1ENg7
         ctEQT2YkXRSZOv+c0ZhVEidPzoglMtwsbftclVDsddwcYCARlJQ9U2NZ3O0pVpLFQDW0
         R/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340570; x=1783945370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=64SAkZFlLWnAyqINmz5UIgUSN27efBkefIrfjT/2tHc=;
        b=tHDwMs4O2CeqyNPNhph5PNkJAwnkU6x0/OwlOk2tGxeZMsLNL+Hhd8EP/iMpNKGAQ+
         1FBUEfDU6NmCFlJhsgJnQ5zwS9kImxKsqUrDudkRBQEDUbmxL1k71QMEgzFjru4hRlMc
         DDmPEIRIUxtZx5Uv2Vm+A3ubPqh/BnhIysSfrHTq5ROE2vtfmujtVkOTUxNPAgn2AW4T
         raFlf8fv5sU90rGaGHmJJ0B6zFWOnE0E1j1gRDNoNKOul29jW9eXj/t9cyNdr/ul/UgN
         o+oF/2EwO00svqWJReBbhgHPSUT+7Lh+a6FYiJqWq8c9lFWG36XRo/hSZNssNNE4QPjp
         K7Dg==
X-Gm-Message-State: AOJu0Yx1j41YeqYtEaom/rw6ispEmN4FlcQdivokIJXJ5/pseZfusrsK
	bzCUsz/usWl+PYPN0u6IwIgHhgxtoxozC/INd4sjOlnVAWathBIHX/cQk6/x1MGCwXjsbDor8qS
	v4MBImLMBUif6AZDL7yJPPVNjr8kSa54=
X-Gm-Gg: AfdE7cl6MsG85ExhLLCfP5VGRhCkxHw7LkNBJb4UM1QQ9MSSz8kquPqJtn8JHsTdwms
	gwLavIuKHogmKkj/WluPXMonMPNGIJ8dTF8zrhCj11ACr5ZSDcvVzIwsy0M9bRn4kFBKOnCkwWU
	CXo/8bS6y43q0Y3y2HxVHIynyuSmsKcs6OhulpA0a3sow2lfgG/7Uvg8vw16TJT65+/GmGU9waW
	WGU1IAVPynHFv6/6oKVrg95YK9Ep4GHu1CIUM5ZrKuuZfRRb1YFiqKbabTWHYzRHREekw==
X-Received: by 2002:a05:6300:67c7:b0:3bf:b5fb:d7ac with SMTP id
 adf61e73a8af0-3c08ed4062dmr410335637.10.1783340570161; Mon, 06 Jul 2026
 05:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com> <178332762342.17485.9754072207529453942.b4-ty@oss.qualcomm.com>
In-Reply-To: <178332762342.17485.9754072207529453942.b4-ty@oss.qualcomm.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 6 Jul 2026 14:22:36 +0200
X-Gm-Features: AVVi8Cc8nNuJ8bP7hmlyl3N3uuBqgOzkIx2857vcJCPSjUKbDMVIv0NgiPjTvCQ
Message-ID: <CAMhs-H-HvfWDhe1C2HBVnZh+uk29inUtoHOKxJPej4WCjTZpOA@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] gpio: mt7621: address Sashiko complains
 and other cleanups
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	vicencb@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:47=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Fri, 26 Jun 2026 08:01:08 +0200, Sergio Paracuellos wrote:
> > This patchset covers some sashiko complains reported at some point when=
 IRQ
> > mapping was being fixed for this driver [0].
> >
> > I have included 'Fixes' tag and CC to stable for patches 13 since patch=
 4 is
> > just a cleanup for naming.
> >
> > Thanks in advance for your time.
> >
> > [...]
>
> Applied, thanks!
>
> [4/4] gpio: mt7621: unify naming style in driver code
>       https://git.kernel.org/brgl/c/83957567b1589bcaf5fafbc359cc17f79a59e=
d29

Thanks!

Best regards,
    Sergio Paracuellos

>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
