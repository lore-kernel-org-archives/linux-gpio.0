Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564885;
	b=W3FpSep7WMIhdQmM2u4pNvVflpnhBgJkTWPslmuCybR++05AgTKmLirixGi+HsI5w3RS
	 5tVsPJxrwUjOKWTHsnQt6rNYlnDBqcGFR3IEc0BcQUlCsM0L6+mtox3U7tye5MXV65qyB
	 RJGumO2nuTd9Zw1ToycAQr2KQz9y/DPHNtDWIRXWVHTZlop72GMNNVq2r4nb5aXq09F0I
	 Mio/GSiVR6thP3frGrJ3N8eBBPGCnYHLslVolqlmKHVrpAFR/WExXXpBpUptXBfCONM1u
	 oPvwHLamx9XvuyrsoblbNUXRl5NO/9nIM0UCt+RjJZwjoj6IRK5t75Y31UISe7HshDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564885;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=;
	b=ZV/HV9x9VIeYtfA/ijvcKG+IpDT9wP5VsEghhjAaLY5l7veD+cHr4gR9d+Qzof9QtkXt
	 93ZMBgJ7e2JsBXVz3oGWAI+xnxIl72is5ja4PwdRaAgnO7ltrAZ39zZSZ5zAFho85NSmR
	 9nPRliZSEFRbzQr/j6cVVlGw+kd/ACs3Od8MH8BgNnZbxOWUNrgP+YN15FH0Qx4v28vEg
	 8cvtQ1KgopnUZENVX8AGHJ0h3riMU5xX+nCw90At2/GmZG9O2M+Zs1AudEq2ChqiLuIfq
	 sgo/bCVbEWsFvJ1qcnRcZvdtLFJd5nD55+6p1+kqXalxwYK++4UMUi1JeOE54+/hSnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt7ogS5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7360606A332
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt7ogS5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD101F000CF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564885;
	bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bt7ogS5JyehS4JxScQVm0sHvkUUYe0Eu1k1IZvY+sEkc18DyCkew3RhO3gVzHlzT9
	 WLHSXtT9W5jQvAk5e1xQBvW2LOcWd+Z21NIoRkbz5CvnVNvyz9ILDbjx+5fdhP4vPJ
	 ogU+oWqvmfK5bVZfEDkuMwbrsXeHYZL5Xcj6kGkJSGlCtrQ4lRzOy7p/Mm0VDdqlVN
	 1DBZII00K0HDkdiXme2fW4VM4JdkL1BYS0m8SV2n4n58Yxv72hlxmh0YZ4xQ+2QDRo
	 UTGnYZvhbOmR8ohAermOtiBnC62kDFjE6z4dTvrBnyqTKr/DTD85RsuNlGOJMlKNDN
	 xGsVf+AWLG0FA==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1001954eaf.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 02:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHt/ic0zkmZs93Zv5S0bzipdAveiMCxkVBZzizXl+7PTO5EgTUJzPWa32B0rHbufi/O1uF5Mlcy/oFf@vger.kernel.org
X-Gm-Message-State: APuU4Z/FFThpkQfClN+9b68EfsI6Lk1SlA7mtNeruXGTVprZKq65eOHB
	4dkghnCzIX6Bibgzf9dRM+iLf8LZXNMvdn3VeZRjOe72bYkP/B2IhbiwmDKgJeuDTF8NFDj+Tba
	+UxDNUDlMYA+s06e5l5MU7ac8JlYD8sc=
X-Received: by 2002:a05:6820:6fc8:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71ab4fe25a8mr1039390eaf.17.1794564884552; Fri, 13 Nov 2026
 02:14:44 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:14:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
X-Gm-Features: AclHuK9TruFFk1ZreyNiLZ_y6WML95I33IY0-K9MfVGzsVGUebv2rlx1RB9oHqc
Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> Five fixes: the drive strength went out in milliamperes, the schmitt
> trigger enable was mapped to the input buffer, the settings Linux
> carries without argument went out as disabled, a setting the platform
> reports off read as set, and the protocol layer read past a
> PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.
>
> Then GPIO function support: report the pin-only and GPIO attributes of
> a function, give pin-only functions no groups, mark the GPIO functions,
> and select the GPIO function of a pin on a GPIO request.
>
> Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
> the schmitt mapping, which the platform does not implement. An LLM was
> used to review the patches and to set up the tests.
>
> ---
> Cl=C3=A9ment Le Goffic (11):
>       pinctrl: scmi: send the drive strength in microamperes
>       pinctrl: scmi: map the schmitt trigger enable to its SCMI type
>       pinctrl: scmi: send the settings without argument as enabled
(...)
>       pinctrl: scmi: give no groups to pin-only functions

As noted:

These four patches applied as fixes and I will also get them to Torvalds
for v7.4 ASAP.

I think we may have one or two more SCMI fixes that need to go into
v7.4 but it's good to start with these.

Yours,
Linus Walleij
