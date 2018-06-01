From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH] staging: mt7621-gpio: move out of staging
Date: Sat, 02 Jun 2018 09:30:03 +1000
Message-ID: <87efhqrsp0.fsf@notabene.neil.brown.name>
References: <1527854570-17200-1-git-send-email-sergio.paracuellos@gmail.com>
 <20180601181347.GA27486@kroah.com>
 <CAMhs-H_u1q7pfTRrU34p0HjxQeAMGPv54EnFBLFbKQLajDw21g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0617554578570156812=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAMhs-H_u1q7pfTRrU34p0HjxQeAMGPv54EnFBLFbKQLajDw21g@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, driverdev-devel@linuxdriverproject.org
List-Id: linux-gpio@vger.kernel.org

--===============0617554578570156812==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Fri, Jun 01 2018, Sergio Paracuellos wrote:

>> I suggest you submit this as a new driver to the gpio maintainer and
>> developers and then if/when it is merged into that tree, we can then
>> delete the staging tree version.  That makes it easier for the gpio
>> developers to review it and makes any cross-tree merge issues go away.
>
> I see. Ok, I'll send this in the way you are pointing out here
> hopefully tomorrow morning :-)

When you do, please also Cc maintainers for
  OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
to get review for the new .dts file, though get-maintainers will
probably recommend that once you have a proper patch.
Also it would be good to highlight any uncertainties we might have
to get review comments specifically on those.
Specifically we should mention that

  The functionality is presented as a single irq-chip but 3 separate
  gpio-chips, as this seemed simplest.  Is this acceptable, or does it
  need to be changed?

Please add my Reviewed-by: NeilBrown <neil@brown.name> to the patch when
you send it.

Thanks,
NeilBrown


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlsR1vsACgkQOeye3VZi
gbnXQA//crgnp4ZI/g2YvOG73tzXrbeP7ok7x29CHWk00ezbo3NXDM4T1VAIEATM
wXo4OsXOiYyw49vQD9ldgvS2b5LKSKG+5b0YBPw0yyLbdo4rgYzpFccUDfc2sq7l
uZ/1+wbIxhnIYboMtfP6uOnqS3WikJoMQj/tOIMzorfVCAOcGJ5hR1hkObg+X6IK
hz7bOPffXJOnZy4jADqvR2M6rswhejCE0XEUcW2smuWCxnknlJoaaTRAXvNWTnaH
cNtNgD5fnkRuNpfyK+jKPR0weAsN6BndNK23o0RhCA7lRGBdZLCH7wUv9Ejiu0lZ
uu69NM3aZp/M5M4cMYoZSovuA2hjdMi++KEgl7SHAc3W0H1fAdqh+eT3DSi/CKPK
1xBnYIEqNDpZxm7+iKyCG5HPB5hJGCKngNnGbjQTaIa+5Jxf66PosZgSadpgniVA
ufnbrbmb9MwZSDilq5l7EVVNFZg735ZHlZ+N8bzlqZi2/MTke5OtT4Il+iglYS2u
baXB0xp7F67R+NUq0DTMxrFciRj6DrUqP4vHLGu31GJ+oTheBXyAjCL65wIuNCg8
5tN/XzIHYUKRZ/GhdHmyKB77/A2ampaQ2N8zjHr+lyIQSBWY6R0h5J4ffs5OLFJ7
vbyfileHUgsaCRuF3sWrrQSYxAYhlS+dNmupUbdszF6O6vO4zU4=
=T/ul
-----END PGP SIGNATURE-----
--=-=-=--

--===============0617554578570156812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============0617554578570156812==--
