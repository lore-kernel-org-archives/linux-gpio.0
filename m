From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: pinctrl: sirf: Use common error handling code in
 sirfsoc_dt_node_to_map()
Date: Mon, 30 Oct 2017 20:32:15 +0100
Message-ID: <72b04f56-be81-5a7d-3a43-abac41dd05ba@users.sourceforge.net>
References: <80911d4b-d819-335c-106e-70d7672e645b@users.sourceforge.net>
 <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdXSVXZNW7a-xf_zyCW-j_KVQbRBdrt8q-SNjGChuDU-bw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Barry Song <baohua@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: linux-gpio@vger.kernel.org

>> Add a jump target so that a bit of exception handling can be better reused
>> at the end of this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Does Coccinelle have a threshold for how much cleanup can be shared?

Are you looking for a limitation of such source code search patterns?

Regards,
Markus
