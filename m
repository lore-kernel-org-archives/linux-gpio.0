Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EC27FD74
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793741; cv=pass; b=UwbcmZ2fOJNjxapKdN2vEESL8DbpV7SnATo+DujTbavKoPbiJtm2JTztjVnVKhjCLbFlrSxPMIzvYpeQFzfjBQkWimp+CpeNnaaj79fkziKyLLEaC3T4Jh0m0p6LUKGsW99q6eZ0IOz33lFWVl4afOwIJXzGaBPpCLTe089n0HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793741; c=relaxed/simple;
	bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnzfT/qpg6PQusSqnfm3lqPGbSRIwXsequOJAB/431PUyvVkuoLSdPGUIlKuK3QMrn/6FdJp47dBJ5AVI3rFwkUJELEQeK+q9LUjqjdXMMKzLBda9DiV2NzxsC4QJGtiOqBYEFBWZD9U24BHqHsM03uUup9lIfsNsQ7P0C+LcGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OatzULzq; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OatzULzq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso744895ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 01:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791793740; cv=none;
        d=google.com; s=arc-20260327;
        b=cwT/ubkyYaEaGojjhjswCkST+SwEMFaKsMqLmOXJwtEpwx3wJ4zFSr0pbKR72gjz0q
         dvRhc/wijgh4wgAnH/i6G+dJDYV4bgAKgNgS5OUjPX65rAyh1HuvDvSrHCEVG2WUJiaT
         gL+LGfDpJbERowmt/lUShtdDwWnwfA5eApxsMjzarfsqQEgzWAfDL0uCqCtjqpowcXZe
         gkKTU516mzD52WnUBYwBOXNIH3ars1ry9ZMACnGzSFhO9EuHLGmVIwHLWjFH8qDris5A
         Wk4psqKy+HWA/U2gqslv9aivktOsqL3xMhIc9Oa1BwNBDjo9SZhobka/t/EvrgkFMgSU
         sa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        fh=WzuAOx5l+u3KZZYqcc214QEeygq9To7VVKWugYV2M6I=;
        b=Znj7bINXxhCcHAvnPebLqpViMt2crKQ2Df0AgplSn+NlY2aw1YkH4H0T94sSbnJc+q
         rjI340csgoPeM9J8Uz0hMZgD4CmEfzG2fhXlUoWs2gK7KrMYOZHN8K9j5QniSgeI/EMC
         rLVqHTug93EoHnkJFZ68FfpXAAeMWtSfLDPLlq2EaHHQC1Am5uKRznIGkHQbbUJaLmIv
         a7IBx1rIrihr0EzFgaVSLnIw6Mpnup5t1t39t32LnzhDizeI7eJoFm405syztUE8uhgi
         IwcP7VDsY/A3toVxxQK478afocbvGKgAO/PtHWyGmNxZZ65sPT/Qo/j2iGjEG6W4ECZv
         kryQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791793740; x=1792398540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        b=OatzULzqEtnQ5YMF47ccNur8/hmuGCKZLGsQ1dnQGg/fXuOJvmGI29p4KVHbGlP0vd
         oNEI5unXdoPeL3Us+O6YkjP/Rdgm1vwgahHz1Y6t3UO8cLtEpXm+wgILspwFxwCuEFQ2
         0hLN4DWlj5W8xz1q198d9w4aCuWAhQMKsJC/LT6lI7daXC+mr5en5BXJ6x7mmFfKhLru
         V7rNU2EjtHGEqCEeFTtYpPQO+qEgqhu3xc39B09NRaZS1vkx1NsRa7XJx6h0+ViO2wB0
         4HIqerQhlFjW/Kma7TbP41WNh/+PpYuBMIIYA3aWsDL5JassIPQEUW8JmRO0iTwLRbTd
         xlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793740; x=1792398540;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwv3GKFD+HaQRthPR2ue3j1pRQ9agY+lFSLeUW3Yjjg=;
        b=R9STuFFMo/bzlA1CcHkcuIZraqM/ctglYmhbI2USAmfkCbPNEmZAWc3b4QfHKnJ9zb
         eFWi7BR93uQDQQ4VHwYM732YgtF0qEHcV4XQd9bcNsXB0png2ehdEak0/UuXhN+PPxp7
         f1kyzMxLZ3DVV52vHu3E124S9W5EaCpFmFmDpQtNsnkB63iTc05LY6iPgAYHkx3Occ2+
         WwxJhA55EqSjec23VKd6YTVcifVMb+PsRPN4Pz+WJ9ISpyRaLJ9eIy6ZI73ef1KLYPiv
         5wmAMwwfqNjf47Xitrw2U4SgcwPiHiSeDwyxctdpYtbLUO3evysshKDU+WTS0ccgYs1Y
         3EUg==
X-Forwarded-Encrypted: i=1; AKwUvBwuYpspO/0mDMWbyIMk8UYMqqakmNID3DolTsltYPRn9D64BckwptADBZHGppDKBmP2JvojMFPOogKS@vger.kernel.org
X-Gm-Message-State: AFq9FYI+hciEcF8sucxx5A/JIrcin9v29xV3IjVSGz7wrVkzFM/5yVai
	C0x01GM2bCGQU3Us2Lf+2m6Wjstu7+oehkbAg4WOR0jc30pPP9a9cfT3sszO3DZj3TsP3CwmGJ3
	JrevM3c3SBbnOEL5Fjpr1//G/b2Xppr4=
X-Gm-Gg: AYBFou0Lm3utPZsyS/K3ZjQngroLhj3Y+flz/A59mKUWmrQgdhqrsXtY0ojF9WCXubd
	MJsHSx6NxRC5rdIkrW7MHRL9+V08JAw9LrN5fY31w8ueWIn5X8DhbKUDLhsEXtC+cP3tRxRs8GV
	r83tJUVn3paEi+9FSRE8w7VnIdZ3sKhww9tKD7mtCpD3ADhFGWyKu0xbGmRTbkHSCAUmcy3GU9L
	bBE7HUnYpBPJ2+il3k39mgN1CTgjhy0uQBxEKl5QarTk5LDMb80jpImpr8E/yxj7dfA1/56lDcS
	I45X7Y3hvVdrqcCqU8AYnMTTCZYFlKxvgzMK9ehXr5p+3DkgokGVzFq8xWylNmmbyx9e5F4/23n
	3PeF9jlYIgkkrTb7SD8J0cDq3YudRBhswgZHKfX1b+q6oR/KMPcyOQLIreWnb4fLoeZocWq56DW
	YZzQ==
X-Received: by 2002:a17:902:d50a:b0:2e6:7c6:8d40 with SMTP id
 d9443c01a7336-2e842bc1199mr76113395ad.27.1791793739705; Mon, 12 Oct 2026
 01:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012015433.6155-1-phucduc.bui@gmail.com> <sashiko-outbox-167547@kernel.org>
 <CAABR9nHKxOze0wryK1XjSdJVA7rsMXiSt=-S8W2QsGdQqP1Evg@mail.gmail.com> <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
In-Reply-To: <CAD++jLkwM6KY-DsYU5-rJSisX17OwNzcq6xNrrw7uRkRCbEcYg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 15:28:47 +0700
X-Gm-Features: AclHuK_3DwYf2CtnpcS0CNjk7I8fINwJNWL-ttEH9GpUI5_HOF9kpcbbnysw1mQ
Message-ID: <CAABR9nFEOFSeXys8b_Z-9rgpSM3wPq0Nww0anc6uMesijttWoA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
To: Linus Walleij <linusw@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for confirming.

>
> I don't understand Sashiko's fringe use-case rambling here,
> I think the patch is fine.
>

I'll keep the patch as proposed.

Best regards,
Phuc
