Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885292;
	b=tVcYuQYWaZMdNVd5z1LcQ9YW5aqmLAiBJmNncj+u7tgFZPabC+abl7ABYY0aISRblO6/
	 1yPPgMxkcs14xRNqzahJ5iBrcdDhsB5pv22rkMkS5UddkcrMCsuyns7w9ItqHHHR55LNu
	 e0MHb4NAjtnSoD9wkMGUALmihm+c+nyEtL9P11UiRMEGlvXuVFQo4KFpPbeKd/TPy3O+M
	 zc3xJYjElQzkhg1Lvo+/ZSsKBfR8IkIa1MUF8pc/cMjRqo8r9ks3pAIARCNzzEFA0hJJJ
	 ZFiavcOyQr42gpDnNmZvwnTHKR8uzn7kMuLxqUw01g3aXyt3vbhGYepbBBO6Ycql3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885292;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	b=019IcREULTKeKjXXoDcUW8tWF5ONiN4+ourrR3ETUzs4k+YzZU5+YDV4i/UOx7QgvVwA
	 C6dyeo1JVfoQzad1iwFp19rS3TR3bEJ/z8V01U4LPK1WjGEzx3ZswZ3z+VsQWRXvrx6Se
	 4a1eDW4ZdSW+PDaFjBOZ5OWydjmchkYkoaCINt8f/AdcS1v5QaS6QD32FI4BwEkLBoNi7
	 iXrnCOL9q74JCSjnIi1Tn+Hj8Al6UVLHnFdrpe6T9U+wnNVpb0/9GrIxAG8Ov6SUw1GOC
	 c0z2s9hlrFeyrdxra+b9ruEY8W/1IyOAA+E5tv/OSzWJgpG95zggQAmHeQBhjh4EuWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E6606A328
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3069F1F00A17
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885287;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XPZFFODhwzMFOPYnFOG/f2gIhmZlzFGR3VM9E9oC8a4Qge/gN/2bdc8JVTBaYSriD
	 dnajOTcdBBJpTxMHp+10l0Hww4xnVZ0fetIDHktnLlpt41TdKtG0jLRinIADCl4h2G
	 H9jkaltZce3g4ycvP2X5mPYMBA1gfAjsP5sGOg2OuR4EM5LCfO+vp/8U7tRacofM34
	 iDJ28HZWn6GSeK6C8KNWCQLlFKH/3v5rxnq3Z53fw/SOOGmAcXpl7LJJaarkym/vD8
	 qRWNwk970yF+LqVNBMWI1q5U5bK09AqlTE7+DQDj2FA3l1W0Orkngo/IVOfFfSff0z
	 AmmNONwv4RLBA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so2257377e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:28:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxeWVul5owxvbm224Z6odBQ9BfNuIuetL5+s3DxXPVSNFXb1vpCs+gI/StkxPdeb67DK3+6s7N49Qdv@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ao5lGxR7INC9cq4XlaBe+535Y7APx5xdUcXF3D8zch6aS9Mvo
	zatPty4kDC/IGcDm7yOuolEkieYyD5myhqngcn6YU3d9Na+jVFI9I19z3R1Ck2L4GPjhE9pNrNQ
	/wFyf28Vv/lBw+Jkj9UQ9JupEDB8eLCI=
X-Received: by 2002:a05:6512:68a:b0:5bf:ec95:41f5 with SMTP id
 2adb3069b0e04-5bfec954634mr3564188e87.36.1793885285940; Thu, 05 Nov 2026
 05:28:05 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com> <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
In-Reply-To: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:27:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
X-Gm-Features: AclHuK8sEV6qv2B1_vrP6a-7LhjJiL37qYSrwskqM676CSWb53N83wbpRw8_kUI
Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:36=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:

> I will verify the requested base, rebase the October 22 version
> and resend it as RFC v3 for renewed review.

Do you have to still keep it RFC? I normally do not apply
"RFC" patches. Consider dropping the prefix.

Yours,
Linus Walleij
