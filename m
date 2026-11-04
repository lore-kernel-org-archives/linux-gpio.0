Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798260;
	b=VFRtjoG8Zy/uEGkife82d0ZDB+5xWAeWbXYFy5YTHj7LM8OJXPf0VYr+i872oM+DulzD
	 Ng+RvhS01e6plDpWLpt1FBj5tHBmQj6C8Bel4OQm+oX6/rM2dAZ20IoVt9KrZAID5LXnQ
	 46LjFJN5OpfhC6tz/sBezEVBggBg8VOwllsUq9cCNaN8tO+9YAqeA/bpVPcnD48S/iMsQ
	 k6GwR2bpGz6rEEDSSQnsMb7RL/M7BLOd11/RKweEBm1V2bZ5NvaksDvyt2uQCveHvAuKQ
	 4/5umnanA5LpdKZittIYyepxr2okXOJSOT5disYsR1M9hMLoDxifpfi9i0eMZWCJHxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798260;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	b=4N1p6+u8LBFfGKSvUI6xy7znlnTZxQ9APegSp7BlCrI2MJD6mjS7v6/3PN8C+lgJ0bAa
	 8XyrXCDuQ+QAdh7woyRCI5PUq8iutZd/1jrYbyvWHcyjt4QK3H6YbzHL7//h/2719uttr
	 fk+h0SjG7bNXArWy6KMyG5rOfQn4fL934Uu5eaH/LEA+N4um7YlGHt/GG5VQNCyYvpKyw
	 RZx2wiGe4vlxvqRHLvsaAUtNOrjCVckf5Y3BqN1JSZXRWNvo5//bQeA1uAkLM0zHtnM3a
	 ivqD8DUZ6ayrxA1Q/T+FETpk3DCxi8AXTHLVFIEL38wO8oXQN0HtjpXDT35sZ/jWGrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngTz6dQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228D606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngTz6dQV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0061F00A02
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798259;
	bh=4pXFqn79QUbBsMjuDsGw7ClhjengxKNrsxIDFCP+w3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ngTz6dQV4u1cbtZTvq2Ky1Ek7OBOoPb8HhWprAVAem8w17mr0cLtoh9m3r90q5K3A
	 xcJ5XSPjn6crcC2Ud6uil9cn1Ppr+IeDwlcYtzTIxfdfgT9FCenCPqaR5f5tpd/L9Z
	 Mp3pTWYiXnWzUTkmYlBS3LKyRZWYw8ZbiOer4RX1RBZ4NKSFICetj5cbh49jC1C23p
	 aDl/f/qsnbQ+sTzEXKln7wwiiU8cfWPdJG9b3Mb0SW/0+Gf2dHAg/HL27uipdvOMHj
	 nlwnvcobwOnvAdpoV2Sxd03RG8A6cwKlZ11q0e5rgvO4QMWpbmMvY7lpnEA29FYLxf
	 QfXiFJXuHV8/w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be416e603cso418835e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzlMu0sJS/SYHGTShWWPmf3Lq6wnNliBmJa6wS0AP/fEehezBat9ZxuX86hSRhgYyJfFExGht1Dlemf@vger.kernel.org
X-Gm-Message-State: APuU4Z+N2TDlo2rql+QkG2+gejCc1cQ+93iOuh6ZN1e8fUmw0KYNVGU+
	Cbfjdv/5aKiq7pw4e8Hu5mShzh7D0S7jYyDi46S0/Svf6KXDGmP+mbFSpx12nBE7fTmzzs/xHBV
	FHs32Cw5XOrmJK9SHE6ZldGsDGj5gVSk=
X-Received: by 2002:a05:6512:1392:b0:5be:414b:a84b with SMTP id
 2adb3069b0e04-5bfd9576229mr6050040e87.51.1793798258371; Wed, 04 Nov 2026
 05:17:38 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com> <20261021204654.1001101-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20261021204654.1001101-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:17:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOe212XpcF=h9hLKKebraCCS9+8bbFSoJGTSyVCH1ttg@mail.gmail.com>
X-Gm-Features: AclHuK-cFjCWPxrNO57RVzPfUWRFqkM8WgAWXlpSWa3PLlTk6Y4p2ZdV47CKjtg
Message-ID: <CAD++jLmOe212XpcF=h9hLKKebraCCS9+8bbFSoJGTSyVCH1ttg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: sim: Replace custom devm_gpiochip_dispose_irq_mappings()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Replace custom implementation of devm_gpiochip_dispose_irq_mappings().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
