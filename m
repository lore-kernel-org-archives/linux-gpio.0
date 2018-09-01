From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH mfd+gpio 1/2] drivers: mfd: Add support for
 Moxtet bus
Date: Sat, 1 Sep 2018 13:45:56 +0300
Message-ID: <20180901104556.ldj4vftjfb5glbmz@mwanda>
References: <20180830144151.13417-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <20180830144151.13417-1-marek.behun@nic.cz>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, linux-gpio@vger.kernel.org, kbuild-all@01.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Marek,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Marek-Beh-n/drivers-mfd-Ad=
d-support-for-Moxtet-bus/20180831-031806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd=
-next

smatch warnings:
drivers/mfd/moxtet.c:267 of_register_moxtet_device() warn: passing zero to =
'ERR_PTR'

# https://github.com/0day-ci/linux/commit/316bda5c94917aa3b0a67c3cf79cca211=
d08138d
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 316bda5c94917aa3b0a67c3cf79cca211d08138d
vim +/ERR_PTR +267 drivers/mfd/moxtet.c

316bda5c Marek Beh=FAn 2018-08-30  213  =

316bda5c Marek Beh=FAn 2018-08-30  214  static struct moxtet_device *
316bda5c Marek Beh=FAn 2018-08-30  215  of_register_moxtet_device(struct mo=
xtet *moxtet, struct device_node *nc)
316bda5c Marek Beh=FAn 2018-08-30  216  {
316bda5c Marek Beh=FAn 2018-08-30  217  	struct moxtet_device *dev;
316bda5c Marek Beh=FAn 2018-08-30  218  	u32 val;
316bda5c Marek Beh=FAn 2018-08-30  219  	int ret;
316bda5c Marek Beh=FAn 2018-08-30  220  =

316bda5c Marek Beh=FAn 2018-08-30  221  	dev =3D moxtet_alloc_device(moxtet=
);
316bda5c Marek Beh=FAn 2018-08-30  222  	if (!dev) {
316bda5c Marek Beh=FAn 2018-08-30  223  		dev_err(moxtet->dev,
316bda5c Marek Beh=FAn 2018-08-30  224  			"Moxtet device alloc error for %=
pOF\n", nc);
316bda5c Marek Beh=FAn 2018-08-30  225  		return ERR_PTR(-ENOMEM);
316bda5c Marek Beh=FAn 2018-08-30  226  	}
316bda5c Marek Beh=FAn 2018-08-30  227  =

316bda5c Marek Beh=FAn 2018-08-30  228  	ret =3D of_property_read_u32(nc, "=
reg", &val);
316bda5c Marek Beh=FAn 2018-08-30  229  	if (ret || val >=3D TURRIS_MOX_MAX=
_MODULES) {
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^
No error code set.  It means we return NULL.  Presumably it leads to a
NULL dereference in the caller?

316bda5c Marek Beh=FAn 2018-08-30  230  		dev_err(moxtet->dev, "%pOF has no=
 valid 'reg' property (%d)\n",
316bda5c Marek Beh=FAn 2018-08-30  231  			nc, ret);
316bda5c Marek Beh=FAn 2018-08-30  232  		goto err_put;
316bda5c Marek Beh=FAn 2018-08-30  233  	}
316bda5c Marek Beh=FAn 2018-08-30  234  	dev->idx =3D val;
316bda5c Marek Beh=FAn 2018-08-30  235  =

316bda5c Marek Beh=FAn 2018-08-30  236  	ret =3D of_property_read_u32(nc, "=
moxtet,id", &val);
316bda5c Marek Beh=FAn 2018-08-30  237  	if (ret || val > 0xf) {
                                                   ^^^^^^^^^

316bda5c Marek Beh=FAn 2018-08-30  238  		dev_err(moxtet->dev,
316bda5c Marek Beh=FAn 2018-08-30  239  			"%pOF has no valid 'moxtet,id' p=
roperty (%d)\n", nc,
316bda5c Marek Beh=FAn 2018-08-30  240  			ret);
316bda5c Marek Beh=FAn 2018-08-30  241  		goto err_put;
316bda5c Marek Beh=FAn 2018-08-30  242  	}
316bda5c Marek Beh=FAn 2018-08-30  243  	dev->id =3D val;
316bda5c Marek Beh=FAn 2018-08-30  244  =

316bda5c Marek Beh=FAn 2018-08-30  245  	if (moxtet->modules[dev->idx] !=3D=
 dev->id) {
316bda5c Marek Beh=FAn 2018-08-30  246  		dev_err(moxtet->dev,
316bda5c Marek Beh=FAn 2018-08-30  247  			"%pOF requested Moxtet device ID=
 0x%x, 0x%x found\n",
316bda5c Marek Beh=FAn 2018-08-30  248  			nc, dev->id, moxtet->modules[dev=
->idx]);
316bda5c Marek Beh=FAn 2018-08-30  249  		goto err_put;
                                                ^^^^^^^^^^^^

316bda5c Marek Beh=FAn 2018-08-30  250  	}
316bda5c Marek Beh=FAn 2018-08-30  251  =

316bda5c Marek Beh=FAn 2018-08-30  252  	of_node_get(nc);
316bda5c Marek Beh=FAn 2018-08-30  253  	dev->dev.of_node =3D nc;
316bda5c Marek Beh=FAn 2018-08-30  254  =

316bda5c Marek Beh=FAn 2018-08-30  255  	ret =3D moxtet_add_device(dev);
316bda5c Marek Beh=FAn 2018-08-30  256  	if (ret) {
316bda5c Marek Beh=FAn 2018-08-30  257  		dev_err(moxtet->dev,
316bda5c Marek Beh=FAn 2018-08-30  258  			"Moxtet device register error fo=
r %pOF\n", nc);
316bda5c Marek Beh=FAn 2018-08-30  259  		of_node_put(nc);
316bda5c Marek Beh=FAn 2018-08-30  260  		goto err_put;
316bda5c Marek Beh=FAn 2018-08-30  261  	}
316bda5c Marek Beh=FAn 2018-08-30  262  =

316bda5c Marek Beh=FAn 2018-08-30  263  	return dev;
316bda5c Marek Beh=FAn 2018-08-30  264  =

316bda5c Marek Beh=FAn 2018-08-30  265  err_put:
316bda5c Marek Beh=FAn 2018-08-30  266  	put_device(&dev->dev);
316bda5c Marek Beh=FAn 2018-08-30 @267  	return ERR_PTR(ret);
316bda5c Marek Beh=FAn 2018-08-30  268  }
316bda5c Marek Beh=FAn 2018-08-30  269  =
