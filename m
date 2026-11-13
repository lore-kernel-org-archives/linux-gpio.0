Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575574;
	b=4w4HU3aY4h8TWcLpZXdv8+wxIn5b12CDq0gWmcpdCapLmppJtuDLgVVuWgg+FfGvV1Vh
	 8GqMvPAKa1Bq8L8aV46PkW50F4ErRoRGosPoLN9rZF5c7W3/N+KRZI9jB3obEFTJcI77f
	 WAzJOtVN4OJXSR9mjSup4DM4D9K8IesnWNI9jjQKgzYhW+bqOKGV1+Dw0GUJHrOGW5nC3
	 ZFGnNEA0P5/jDQ6KY3ionUHlEutHKj636iSN8T4Q3eVh1CmehPN0iMJWnZCmd8Ulcq1RH
	 EzQAKJ/vmR8QwaJksvKDaUOUSw6o7dqbfZ4tA8gEKL4D+0Y/9x3j3l9aHkzo9NC+aMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575574;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=;
	b=T5bBjlGX45UtrMHMZKbEnulzwqpZIjqIHFS5UFzLwPtVMw9kqxAo7TmCX/E6+dAzV5Vi
	 nlv8M2tygfnhdWZYrR0BQD6D6696Ho9Li6x8NGBuXRBDNUk3Yg/ptflE9e+n+2nB5HKAh
	 QeMY12l4Z5kOPNKjXQ/GddEz6XUCtEqzihOeMRu+grxYn0ZYa2ElxzElF5d044KICtZK0
	 fXhn4HxRtkCAWrLnL0DF9BjYRZwc0yCh6qPlOMSVupai4fQddQRao4tZYVSWygjpGXMKJ
	 hI1FrFdttk9VSewWue5S5u65CC1uJOX7LfC0gQ+YNx14hRGact7AgarQXm/0Ilcs+PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyskekEA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39740606A8A9
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyskekEA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137A1F000C5
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575573;
	bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cyskekEAdhtrPKmUr/gE2ThgA7q7NVKzsV4u4W4HbaBqmHFsDI2iN/hkL+YZs9N/b
	 UmV5t0iSJkFp29o86TmJIE2qqhltYZ1tqguxVdjr+5/KUzX+i7naCNolXlQgisd4gH
	 rQjalS3iELABZ/bnOO7VCoyqXi0A7DJ5EZLP088yRBUX+LtT4IiKQtuL7qwpKgjbvD
	 SOTzhTKhYAUI/2eECaWWpMGQnMGgRHmYKGveSMCrER0bofsJltyX3ycf51T+M2Y5kf
	 wufBl0gA8j0nX1sBNQ2uOMWEqTQl3GbMoJTWNOH8oI/KlxkAjhB2HS4jWd6jEppmBV
	 5FI604C/FopdA==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716b58a4365so1076436eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 05:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGyLcgFMs7yXW52N9+IEWGkCEIp1Ocq6hXw/yZWv8XXQVLBZqAl9CZ5L1jy1858eSsfRQlKPjYVITto@vger.kernel.org
X-Gm-Message-State: APuU4Z/4936DFRku2dWY2oorezJ5y6X1Tld3qiL8adRz3HHYG5+u3793
	4bnHo3VeDmw6AkoIva245zpKRPkOg/Q3E0hmBTVFLtK0ZCu9XkA8NhTtvf5Zb2LnBTE/R/1tGQH
	bT7RO0pNhEhgckA6+TGueYwXVoxqaqt8=
X-Received: by 2002:a05:6820:60c:b0:6f5:1e7f:c65c with SMTP id
 006d021491bc7-71ab4f38fbbmr1236618eaf.33.1794575573123; Fri, 13 Nov 2026
 05:12:53 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 14:12:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
X-Gm-Features: AclHuK-XfwbbsThDWRKKp0Nlzp5SCGGel7-dOlgu3vEKR4VlZvcMoWFny-hIjEw
Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: bcm: Two bounds fixes and a dt_free_map cleanup
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com, iivanov@suse.de, 
	andrea.porta@suse.com, phil@raspberrypi.com, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 6:32=E2=80=AFAM Xiaolei Wang <wangxiaolei01@kaihong=
.com> wrote:

> This series fixes two out-of-bounds accesses in the BCM pin controllers
> and drops two hand-written dt_free_map callbacks that duplicate
> pinctrl_utils_free_map().

Patches applied!

There may be futher comments and/or Sashiko moanings, that
stuff is better addressed in-tree with follow-up patches because
this is GoodStuff(TM) that needs to be applied.

Yours,
Linus Walleij
