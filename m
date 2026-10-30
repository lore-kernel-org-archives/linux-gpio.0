Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360147;
	b=P/FXhJh79vMJZ+RH/RzBvPt7vrIjlr14Z0aIaGt8qvgIKQJJldFcu4j1hbQR+fjUZWvY
	 qhy8Ctp/hRPF7rGvDBfREf0HmIsVOWeL6F6I7//UHemldR/cb2pVQheIyLNMPw+R9pJjW
	 1H8z6ukCp6mZwVPPP/Bgb5WdeN7c/Pm5G8ZVZ9JJBN8PAw0I73oi38YQgv5rG5ULJ0cMB
	 CJ9ifuOisYX+Yf4yrexzfuCElrK9O5fWSEF5iqCa0iOLG/cN2joy2GgmvVOBtmzKaZeKq
	 7kvr2ry3rQyH8InMNx5VohHafJ3C69mHEPqzRn8kETaQFX1uVIGsJNKeAhRLN1VedFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360147;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xdJscdkcqSQm71LXZ7gyl8JntmnGJfYBnPIS03U+ncY=;
	b=n0WxT1focqZ5vjcdIq2jxbwEgH/mTGj2ITDaFlFvAmDU7OvCo8liRSb477eDI/Y5Kr+6
	 HrhIkGQWGa+VHpJdtRKANxfhywJTJVoPUhiPX2axE8U24f8D+boDbMN0A/YuFMH2VSMkE
	 AOQGfIhtncgjSNS41nGiS01ui2mPjDOjMSL/pGkRBO4rcOqYXQUYtHGdwwyAawIMmqCj/
	 lhQaQBcE1Z45OfXUkl4OdG9/F6nV7P7MsbUfVv2sarmXThRRX+ZGw1jlriQZvHy5tzV63
	 wbo7LGWJ49LW6HmCTZCmSa58naw194aFA+AsXivpe6jZsm/V6YFsCWo6ZCUKpL0YOeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XViHe1cL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC693606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XViHe1cL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B001F00A24;
	Fri, 30 Oct 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360146;
	bh=xdJscdkcqSQm71LXZ7gyl8JntmnGJfYBnPIS03U+ncY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XViHe1cLBXGp+c/dDr5CNuKpARP1U/8jlZVMyL2CQ5U2pEK5ApCUmCtarEek3+UJN
	 T7B+h6cbeRzaTT5qPT8ZCOm7663aDatfs3gM+pQs+fetdz6UmVFsaFuYya0pf9aIYm
	 7qmOzFMeLe5YOmTmkcNqSp96XCnmUq9j6V/wwEbMiQUpWp7XqqEbzV0fTI7ejOC1vQ
	 /xoPY0jATUBfPjI1IGL6rPloexFwIV42irYxY2Vp4SQKdmUQ38JgFmEm86I6MtoVlp
	 2gBInjswVQlJZ5OLQtHM8D/ioXfi5n9xux09FFLGXG6R7bw4rRjiJas9hNpp4ZpW2F
	 mV0GAR6+OLcXA==
Date: Fri, 30 Oct 2026 12:35:41 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Payton Fack <facksweng@gmail.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux-gpio@vger.kernel.org, 
	vfazio@gmail.com
Subject: Re: [libgpiod][PATCH v2] dbus: add optional D-Bus activation file
 for gpio-manager
Message-ID: <5pdttqtvdexzj7dqca5gvpcqfosdgdp22h4llgzgyw4oraapto@uxmztg5n6edq>
References: <20261029163426.407719-1-facksweng@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163426.407719-1-facksweng@gmail.com>

On Thu, Oct 29, 2026 at 11:34:26AM -0500, Payton Fack wrote:
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
> On Wed, 28 Oct 2026 at 12:27, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > This has none of the sandboxing features the original .service file has. :(
> >
> > It also runs as root, as opposed to the gpio-manager user.
> 
> I updated the file so that the dbus service must always use systemd to
> start, since dbus service files do not really have the same sandboxing
> features.
> 
> > > +if opt_dbus_activation.enabled()
> > > +  assert(opt_systemd.allowed(),
> >
> > What about systemd_dep.found()? If we allow systemd but it's not found, the
> > config will just ignore this one?
> 
> Updated to use systemd_enabled

Please use a logical changelog format, like so:

Changes in v2:
- changed foo
- added bar
- Link to v1: ...

Preferably use b4 to manage patch series.

> ---
>  dbus/data/io.gpiod1.service | 8 ++++++++
>  dbus/data/meson.build       | 7 +++++++
>  meson.build                 | 6 ++++++
>  meson_options.txt           | 3 +++
>  4 files changed, 24 insertions(+)
>  create mode 100644 dbus/data/io.gpiod1.service
> 
> diff --git a/dbus/data/io.gpiod1.service b/dbus/data/io.gpiod1.service
> new file mode 100644
> index 0000000..893ed74
> --- /dev/null
> +++ b/dbus/data/io.gpiod1.service
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: CC0-1.0
> +# SPDX-FileCopyrightText: 2026 Garmin Ltd. or its subsidiaries
> +
> +[D-BUS Service]
> +Name=io.gpiod1
> +Exec=/bin/false
> +User=gpio-manager
> +SystemdService=gpio-manager.service
> diff --git a/dbus/data/meson.build b/dbus/data/meson.build
> index 8af178b..e790a78 100644
> --- a/dbus/data/meson.build
> +++ b/dbus/data/meson.build
> @@ -18,6 +18,13 @@ if opt_systemd.allowed() and systemd_dep.found()
>    install_data(gpio_manager_service,
>      install_dir: systemd_unit_dir,
>    )
> +
> +  if opt_dbus_activation.allowed()
> +    install_data('io.gpiod1.service',
> +      install_dir: get_option('datadir') / 'dbus-1' / 'system-services',

Can you use pkg-config's system_bus_services_dir instead of hardcoding
it?

> +    )
> +  endif
> +

The following command:

    meson setup ./build -Ddbus=disabled -Ddbus-activation=enable

will not install anything and not warn either. Please bail-out if the
user wants dbus-activation with dbus disabled.

For --auto-features=enabled the default should be: yes for dbus, no for
dbus-activation.

Which made me realize the guard for systemd's D-Bus dependency should
check if dbus was found, not only allowed. It would be great if you
could prepend the series with a fix for that as well.

>    install_data('90-gpio.rules',
>      install_dir: get_option('libdir') / 'udev' / 'rules.d',
>    )
> diff --git a/meson.build b/meson.build
> index 7045d29..598ee3a 100644
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
> @@ -172,6 +173,11 @@ else
>    systemd_enabled = false
>  endif
>  
> +if opt_dbus_activation.enabled()
> +  assert(systemd_enabled,
> +    'D-Bus activation requires systemd support, which is disabled or was not found')
> +endif
> +
>  if opt_bindings_rust.allowed()
>    cargo = find_program('cargo', required: opt_bindings_rust)
>  
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

Thanks,
Bartosz
