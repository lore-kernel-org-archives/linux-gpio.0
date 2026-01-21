Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E644D6B0
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997669; cv=none; b=S8zfUBZbgIch7Pxs5bKccX4C9x6fj5nIQ8piPcLqpgdP355LT4tAKKLFxpUuc0oHx1buOA/jMXoJb225ip5iQPwtdZG4XU2WqCjyyoLcZCTsOV8GzJc4qOe5088dqsEUNjMDcszfWq82PAk4VkrgXHGTW+BdxRfJC/YAUrAseDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997669; c=relaxed/simple;
	bh=MxAb/KOfj0fTzSsftS+TuyTlZQjPgm8LRuldwJMvBAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5WIW2n6+BQXq5UymGaZS2q+pRThqpU7vPoTZ3DNa2MAUGQe/yXSXxdr0d8K9omu2du1IF5pOlA4jm1B6GFydj/w303X8eXLoZputm1BaVSIL546EZnGdTL6UyqEqvVUhqsF1G6+m/KP6EQ7RCepf6wDtF+74V+bPP+Yg8RrNfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qA9aeMCM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qA9aeMCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3054DC19421
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997669;
	bh=MxAb/KOfj0fTzSsftS+TuyTlZQjPgm8LRuldwJMvBAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qA9aeMCM70d/lIgRo9XveyJzh2U4zy0Cgmw1XNf/c9KGq7MgJvaPy3l0FzZ2AsrOX
	 rGKbHySsF0r049G+5gCJOOUSg1w7lwXzAQVOOMIN0Z5xXaS0/6xyPrc+FCNG/5IKZo
	 enj4K44GiCkcsQz9uBdLJ1kwk+LCH0p8dUlkKCoh5EKx9t//iCA+6jhl0YzmLAGv6t
	 qqMMisOyR/i9De9zXYBGkx1fk/FEOcQQnphghpOwyd//lUYAOK0C3U5wCy97IsIGIp
	 peUi3NgCmN8PFM+3hc1sXjGFiO+maBZpeXZVQZ2CvopdTI0X+tGcsMYu9g0r1vaAcn
	 wwh7B/PXqgsCg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649278a69c5so3508571d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 04:14:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVK1oh4+P3Ms/QYu8HP/fB2FnvL+wzwqIAxQCSZbigljAuw3rY8B7Ns1cffU4ljNs2dwBpFNSXYrgW7@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaSTQnO/xeH6wY5vSW/JV4u5fDd7WmD6SxuETFurpuBs+TI76
	MEJNzXbQx65iogC76kosxnFFSXbNi2tncau5rGAmXuFTUQKCe/TOiRq4dK3Q6u8vdXr9FofXm5b
	HTtVOvrLohpkKMQiG63huOWnDSp5/YfQ=
X-Received: by 2002:a05:690e:120d:b0:644:53c0:299f with SMTP id
 956f58d0204a3-6491650dfa8mr14643804d50.74.1768997668593; Wed, 21 Jan 2026
 04:14:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
In-Reply-To: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:14:17 +0100
X-Gmail-Original-Message-ID: <CAD++jL=EL8yMGJfUCVtcbDHCH4NtUYCjnJLpnXDUXOW=2e2R6w@mail.gmail.com>
X-Gm-Features: AZwV_QgRSTxqPkvEjhSuHvrEvLq-M0kHecgsqzZs-SN8L9p0Qy5A7sM1G0FOtnk
Message-ID: <CAD++jL=EL8yMGJfUCVtcbDHCH4NtUYCjnJLpnXDUXOW=2e2R6w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Microchip mpfs/pic64gx pinctrl part 2
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey Linus,
>
> Rebased as requested, with the dts patch that snuck in dropped.

Excellent, patches applied!

Thanks Conor!

Yours,
Linus Walleij
