From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: sirf: Use common error handling code in
 sirfsoc_dt_node_to_map()
Date: Wed, 1 Nov 2017 13:33:35 +0300
Message-ID: <20171101103335.y5t7id3okn55r6a2@mwanda>
References: <80911d4b-d819-335c-106e-70d7672e645b@users.sourceforge.net>
 <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Barry Song <baohua@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Julia Lawall <Julia.Lawall@lip6.fr>, Linus Walleij <linus.walleij@linaro.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Patrice Chotard <patrice.chotard@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, SF Markus Elfring <elfring@users.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Really, the of_node_put() is connected to the loop and not the function
so the original code is the right way to do it.  Otherwise if we added
more error handling to the function then normal kernel error handling
wouldn't work naturally.

regards,
dan carpenter
