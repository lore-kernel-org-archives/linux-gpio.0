Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA333988E3
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138755; cv=none; b=NgB0tlWBc/HUIED/LS+tPs8A1ljCKoLo8OE5OqEGSEQv1tjExSBf9+pP3YNcQ0JSBkOQevfa02qIdzdtWTKfiBy0IznCSD7SAhMuN+I7M7JhQrEHtjUTvPIH4BYVN6l6YR6EiF4lIxQIRSgNoQDDD99HTZ6d9XD0eyc2+y2qrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138755; c=relaxed/simple;
	bh=s7e3BKTijsqW8nFOP4vYaD/QggbJU0pWrTkU8DU0Vt4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RmYJz1AV8MsbGu8BYVUzTlMTqGVshCAU+i0xyxwIZLnSx37V0irHxzW39RecwFEHzA8csJodyWPjiIANTspjm5oHq7B7swbROcGQypCbFriUe8HgvH+G9GXarSxu5P3+Aa7fpUoBu5C5wyejrxjvUkv+Vy81uBAnDMh8c7NqDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljMgWA1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljMgWA1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC95C1F000C4;
	Fri, 16 Oct 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138754;
	bh=Ak9mlKjzPfBq4rUMe8QZGR8npP1hRvw4mSztSqQT92E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ljMgWA1t4rS0TWWbCcizNWiCSAtIXop0IHypjLu80+j58+WGZhc0cXuEmvnMnVUS4
	 /1QKOrnehEcQF/dPpQCluged+equWJVyF6XXynDQKdzSNQnP758FDI5LGdbWHJjO97
	 9hBH1sNbi11f4bK8kkKVqMrka8RB/Eo7LarNoxm7iD6JuacykG2BF1x5lVXxFtPk/n
	 bgHEAWjfH48J4NSQ+IsySTZh4VyWV9fVNJ4Upfkxg4eyXyAIdqFgvdOkz2xgjSsW43
	 1fZ5/WQquRtvNjEZ0c8TRRFOwfa6Cpt860jk/aNTwmIxlJCbYYs2sDICZwbyxTn47Z
	 qDexEmwJQFcgA==
Message-ID: <sashiko-outbox-174010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] gpio: sim: access sysfs attributes as const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>
References: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:19:13 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpio-sim: incomplete sysfs attribute constification
--

commit 055dde35eca9fff8d54ca501f4fca6d98889dfd8
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: sim: access sysfs attributes as const

Use the const variant of constainer_of() to access struct
gpio_sim_attribute which wraps the dynamically allocated sysfs
attributes for value and pull of simulated GPIO lines in line with the
currently preferred approach.

> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 0c73bec042670..e0ae586cd08d8 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -59,10 +59,10 @@ struct gpio_sim_attribute {
>  	unsigned int offset;
>  };
> =20
> -static struct gpio_sim_attribute *
> +static const struct gpio_sim_attribute *
>  to_gpio_sim_attr(struct device_attribute *dev_attr)

[Severity: Low]
Does this function signature need to be updated to take a const
struct device_attribute *dev_attr?

Since dev_attr is still non-const here, the container_of_const macro will
evaluate its non-const branch, resulting in a non-const pointer that gets
implicitly cast to const by the return statement. This makes the generic ty=
pe
selection of container_of_const largely redundant.

>  {
> -	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
> +	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr=
);
>  }

[ ... ]

> @@ -272,7 +272,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, s=
truct gpio_chip *gc)
>  static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
>  				       struct device_attribute *attr, char *buf)

[Severity: Low]
Should these sysfs callback signatures be updated to accept a const struct
device_attribute *attr?

The callbacks still accept a non-const attr parameter, meaning the refactor=
ing
to const attributes is incomplete.

For a full migration, the callback signatures should accept const struct
device_attribute *attr and be assigned to the appropriate show_const /
store_const function pointers in the attribute definition.

>  {
> -	struct gpio_sim_attribute *line_attr =3D to_gpio_sim_attr(attr);
> +	const struct gpio_sim_attribute *line_attr =3D to_gpio_sim_attr(attr);
>  	struct gpio_sim_chip *chip =3D dev_get_drvdata(dev);
>  	int val;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-gpio-sim-c=
onst-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com?part=3D1
