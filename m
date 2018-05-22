From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2] gpio: mxc: add clock operation
Date: Mon, 21 May 2018 23:27:45 -0300
Message-ID: <CAOMZO5BJy-jEKywyN515+5W-bmA01v7sWsgDj0=5wtBCqsHSYQ@mail.gmail.com>
References: <1526951717-12347-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526951717-12347-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, NXP Linux Team <Linux-imx@nxp.com>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Anson,

On Mon, May 21, 2018 at 10:15 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> Some i.MX SoCs have GPIO clock gates in CCM CCGR, such as
> i.MX6SLL, need to enable clocks before accessing GPIO
> registers, add optional clock operation for GPIO driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V1:
>         add missing clk header;
>         remove FSF addresses in copyright to avoid check patch ERROR.
>  drivers/gpio/gpio-mxc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 11ec722..2026f94 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -14,12 +14,9 @@
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
>   */

This is an unrelated change and should be part of a different patch.

A patch that converts this driver to use SPDX would get rid of the FSF address.
