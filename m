Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025830;
	b=l9H6eHxP0YuY8OOzcsMSyEjN/qZFTVTX4EZfZI0HMWB27Whf0mIVHUwqM8rARaEmwW3p
	 73Y0SpaLUHJpVvUqh6PObmLcfC25QoHIB+8sc14FFov5uxHeRMiVCFYqwHLgeeOy3nP5P
	 d634OXGczfK+V8ZV7BDel2KX5scIBCUCsTfUAjGijFvaBR0ruSn+579dWxyQ2rClly3Z3
	 JJO62VHTt7KMD7pY391CqrsczDX3ZFJT+o0GNo/qDVXzUOG8w0Z6N69FdNmCFns16x5S+
	 eAL8wHdxQ4huu4q0VEnr6TblaAKe3klKQrhuJZxrtK2xds6B+4u9i5YxRiBFOZUtKYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025830;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=43NE97/+suR2lvMlOlQq/OVozCS12mum69E+yjyBLwU=;
	b=N5vM4n41nYQ9ztR9cntYd0CakmXz623sDQtInVgmds93ZVi3u0WPHDrzd3SSOfKDrXPz
	 N1nxnyW0gPryUq+7PbLAe0tAS23XcrB0wxCSH5q2KkADiQyCeQGZb7qEDFB9vwlju0ViZ
	 zKD/MUCsaET8b2xH6E0umsUXW7K0bqY9OpDb9n4WAzEIl0Q+iwCVHmWYvLU0dpQ4JMKfT
	 gRclPEFqUPixNpBqV56tFdeJFV+BO33ZcKzzzSh5PjBYFDJmGaW9pS97+MbeyEMppGcK7
	 eOmN0ix9WwQyMRwl9C6IAScZrdfRC3oX9N+pFPktgF0aDuLf0OZF2fonxXTNlMbnBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESzuzTBO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C28606A32C;
	Wed, 18 Nov 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESzuzTBO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8931F000C6;
	Wed, 18 Nov 2026 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025829;
	bh=43NE97/+suR2lvMlOlQq/OVozCS12mum69E+yjyBLwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESzuzTBOdkG4ZukOFhNH6zujywousEuGxMY42b71Y6toogP16WegXnUnOOwAu2xZM
	 94LZk5i9vZhTnQXMXusP42QNdAlAe9KShFKOVk+B+6bhewI2T+RxcPnL/YG8kc0AXz
	 2CM5e3dLzcfJeAeLi4ajfCEs0OgeRZdhvp0phDi97Jad8vI5sdxu2UG2Veh0u6eDEi
	 EixE7c/90DvlK3vM7prJB2HR0cHe/IPJOWqcXbDCf5E3++orBQyflIVHoTC3fDAJD5
	 Qx4f8tr5ICkQEvJf4wnJbU21ZSvJhLcYj8DtScqMT/nkgLgm7ZWIzbis6+ubU2ux/A
	 MzFijBjpm1v4Q==
Date: Wed, 18 Nov 2026 18:17:03 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v3 6/9] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261118-refried-storm-d43378dd6a28@spud>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-7-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nod0t4s8ldmFfdkU"
Content-Disposition: inline
In-Reply-To: <20261116174854.342912-7-john@phrozen.org>

--Nod0t4s8ldmFfdkU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 06:48:51PM +0100, John Crispin wrote:
> Document the AN7589 pin controller. It lives under the GPIO system
> controller and selects functions through a separate IOMUX syscon,
> referenced by the airoha,iomux phandle. Every pin is a GPIO in mode 0.
>=20
> The AN7589 has no chip SCU dependency and the vendor SDK carries no pull
> or drive registers for it. Groups follow the SDK naming without its _grp
> suffix. As in the other Airoha pin controller bindings, a function names
> a block type, such as uart or i2c, and the group selects the instance. A
> node selects one group, except for pcm_spi and pcie, whose groups carry
> different signals of one device. The PON groups keep the working mode
> only: the SDK encodes the driver reset sequence as extra pinctrl states,
> which belongs in the consumer driver.
>=20
> The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
> one group per pin. The pin also needs its GPIO output enabled, so conf
> nodes allow the GPIO direction and output level. Pull and drive
> properties are not allowed, as no registers for them are known.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
> Changes in v3:
> - Move the IOMUX syscon compatible and the GPIO system controller to
>   patches of their own (Lee, Conor).
> - Allow one group per node, except for pcm_spi and pcie, whose groups
>   carry different signals of one device (Conor).
> - Fix the uart5 example, which listed uart5 and uart5_full together.

As discussed elsewhere,=20
pw-bot: changes-requested

Thanks,
Conor.

--Nod0t4s8ldmFfdkU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3rnwAKCRB4tDGHoIJi
0mgMAQCtXqMjFyJDkPv8x2z7GuoGiMd4YO4oxN1j6Y64gK6v7wD/ctkEr5B5wNU4
UN8LKSfygbDfpSW3r7urO7YQwtw7bAQ=
=apU9
-----END PGP SIGNATURE-----

--Nod0t4s8ldmFfdkU--
