Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186869;
	b=5j+piGNBnWoTl1p6VC3elvPLjnFxQUauXmZ20JtVwgHzq3F1jK1RPneYNUUF0+rXqOE+
	 amQviJrKQfmvZGxlFJSWmvyxNrfacv0io4Md0EbSYdGBgACBc8rQZ+xIqlg/tzkgCtX7I
	 qXxUyHYogP2P2VtU5hxUCq7e07PTPihisEoweFOJd7Boz5cNzYVDl3HZfcfv3qA5PCKRq
	 SxTOHOZ8dnGiurNiCZa+Xo6Ep4TJXWBFbhSTOwxV8pEcMpKvBeK3xxmWOm5MWn050X3zf
	 nOuVJ5fLCTS6TTnYIs3yc/TOY9IoLpWz6Z0vAX+D1B5kiB16GqDZTJKm3EJXQ9J6iOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186869;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=SmLUJ/GuAKy505CznLpvzyDDzxRuTNDAZ0dRPGnd0GU=;
	b=B9Bk0pP1+mKsu5M7bYFP56zdX/1BXxh0e1PeRU0jm6pbmxxoVsCdK8aazGlcG0pcxmHq
	 jeBw7950FQw/osmdKHeJ9WKKTpRk8tFBNmP84jI+k/q3GqbWyLUp4x5IKydPl0HrWY8MB
	 bAIARSVWMemDOWtG5zdDmbrTVBd+hQp0/V2Gw9N4wesILit3uSRDkbw2LkLY3TG/lGfar
	 fpYZFt1HXTUSvj50qD2kE7XNw7NxoMrjLTXfD3teRYOGiSrWHv+X1yHI8p2jPnPDvXre9
	 BEsBU0Pw1v5N0u6B7qwfd1aJyB10FFKmYbKZvhkuVJcDqgBl7l8vSBXA3EO5B2rJPXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dpi43dmQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF8606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dpi43dmQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C5D1F01829
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186869;
	bh=SmLUJ/GuAKy505CznLpvzyDDzxRuTNDAZ0dRPGnd0GU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Dpi43dmQa13PzdR03bzDEuuiQlmYvAWBZMVTBSIKd559VFRGckOSKtd+pweCrJpSo
	 zXFnP9Nviz8lgaKMGxIBsQUJC/7acwzmH8RqlfsMRzp8fNCQWFXuykS9RqWTdzOy1D
	 iMdZ3cd+5NzV+i0+s7VdnaPjxCybAc6oq/VwmgZ9jL/onEYM440LNHcUz+DQpf9+7t
	 HhikEOgDqfuTz8/r+YIrTz294VMglnBNQJHIZ69DuVmTmQBPKMxtHs6TorfP3cO6BL
	 NknzKhBOVb50xTeoI7grHDV7S6uGpSDuJO/EQBhKBb9RsqzYRXOF1GTN7neZO2r987
	 zta1uui1x9/CQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a49a022221so5097731fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 04:27:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMvRHTwDjR+Ui+8heAbbn51+CZRZihLBmaUqqo3BaaIwUZjBaJ2sLpMaqAP94GJ6Hl8gD7/UQ4HGwZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJaJwHQjPKL053mbMobXggW5ef57cjugEVgtjX1BqmkRA1NCcok
	89vpg/QCgmqRv9AO/+cQR27WcPuuZARUzVB9sb0laUAY3qE8yez1H3UFMOqkmqoJh7TBsTn2Rb9
	2WW9wXaYkGYs9OTebMkU11f6Q5BSXg5K+M+J3KuZBdA==
X-Received: by 2002:a2e:8a88:0:b0:3a9:a20e:ecf6 with SMTP id
 38308e7fff4ca-3ac9cf92b00mr3609501fa.25.1793186867743; Wed, 28 Oct 2026
 04:27:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 04:27:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 04:27:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261026221323.2235111-1-facksweng@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026221323.2235111-1-facksweng@gmail.com>
Date: Wed, 28 Oct 2026 04:27:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc_K1B=5S3YsAiRc6s0My4rAb0ktLk26XawijnVEOGvow@mail.gmail.com>
X-Gm-Features: AclHuK8KYqPZRVj-U_wvHlfnO0_jOApAZa6RAE0j_49cUaIvo9zf9bjbPoPNhac
Message-ID: <CAMRc=Mc_K1B=5S3YsAiRc6s0My4rAb0ktLk26XawijnVEOGvow@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v1] dbus: add optional D-Bus activation file for gpio-manager
To: Payton Fack <facksweng@gmail.com>
Cc: vfazio@gmail.com, bartosz.golaszewski@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 23:13:23 +0100, Payton Fack <facksweng@gmail.com> said:
> Add an io.gpiod1.service D-Bus system-service file whose
> SystemdService= points at gpio-manager.service, which lets dbus-daemon
> start the manager through systemd on demand when a client sends a
> request to io.gpiod1.
>
> On-demand activation is not wanted on every system, so gate it behind
> a new dbus-activation feature option. It defaults to disabled and
> requires systemd support. When disabled, the activation file is not
> installed.
>
> Signed-off-by: Payton Fack <facksweng@gmail.com>
> ---
>  dbus/data/io.gpiod1.service.in |  8 ++++++++
>  dbus/data/meson.build          | 13 +++++++++++++
>  meson.build                    |  6 ++++++
>  meson_options.txt              |  3 +++
>  4 files changed, 30 insertions(+)
>  create mode 100644 dbus/data/io.gpiod1.service.in
>
> diff --git a/dbus/data/io.gpiod1.service.in b/dbus/data/io.gpiod1.service.in
> new file mode 100644
> index 0000000..62afbdf
> --- /dev/null
> +++ b/dbus/data/io.gpiod1.service.in
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: CC0-1.0
> +# SPDX-FileCopyrightText: 2026 Garmin Ltd. or its subsidiaries
> +
> +[D-BUS Service]
> +Name=io.gpiod1
> +Exec=@prefix@/bin/gpio-manager
> +User=root
> +SystemdService=gpio-manager.service

This has none of the sandboxing features the original .service file has. :(

It also runs as root, as opposed to the gpio-manager user.

> diff --git a/dbus/data/meson.build b/dbus/data/meson.build
> index 8af178b..e5eb283 100644
> --- a/dbus/data/meson.build
> +++ b/dbus/data/meson.build
> @@ -18,6 +18,19 @@ if opt_systemd.allowed() and systemd_dep.found()
>    install_data(gpio_manager_service,
>      install_dir: systemd_unit_dir,
>    )
> +
> +  if opt_dbus_activation.allowed()
> +    dbus_service = configure_file(
> +      input: 'io.gpiod1.service.in',
> +      output: 'io.gpiod1.service',
> +      configuration: service_conf,
> +    )
> +
> +    install_data(dbus_service,
> +      install_dir: get_option('datadir') / 'dbus-1' / 'system-services',
> +    )
> +  endif
> +
>    install_data('90-gpio.rules',
>      install_dir: get_option('libdir') / 'udev' / 'rules.d',
>    )
> diff --git a/meson.build b/meson.build
> index 7045d29..759c365 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -55,6 +55,7 @@ opt_bindings_glib       = get_option('bindings-glib')
>  opt_dbus                = get_option('dbus')
>  opt_introspection       = get_option('introspection')
>  opt_systemd             = get_option('systemd')
> +opt_dbus_activation     = get_option('dbus-activation')
>
>  if opt_bindings_cxx.allowed()
>    add_languages('cpp', native: false)
> @@ -85,6 +86,11 @@ if opt_systemd.enabled()
>      'systemd support requires -Ddbus=enabled')
>  endif
>
> +if opt_dbus_activation.enabled()
> +  assert(opt_systemd.allowed(),

What about systemd_dep.found()? If we allow systemd but it's not found, the
config will just ignore this one?

> +    'D-Bus activation requires -Dsystemd=enabled')
> +endif
> +
>  libgpiod_inc = include_directories('include')
>
>  libedit_dep = dependency('libedit', version: '>= 3.1', required: opt_gpioset_interactive)
> diff --git a/meson_options.txt b/meson_options.txt
> index 64e3c14..1ec7f07 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -34,6 +34,9 @@ option('introspection', type: 'feature',
>  option('systemd', type: 'feature',
>    description: 'Install systemd unit and udev rules (requires dbus)')
>
> +option('dbus-activation', type: 'feature', value: 'disabled',
> +  description: 'Install D-Bus activation file for gpio-manager (requires systemd)')
> +
>  option('systemd-unit-dir', type: 'string', value: '',
>    description: 'Directory for systemd system unit files (default: from pkg-config)')
>
> --
> base-commit: c2e9287333d7be588b3acaed7bbb1c58d7b551be
>
> Many Thanks,
> Payton
>
>

Thanks,
Bart
